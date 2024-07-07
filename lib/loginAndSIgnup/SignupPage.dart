import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/productPages/productPage.dart';

import '../commanWidgets/myTextFormFeild.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String fullName="";
  String email="";
  String password="";
  String confirmPassword="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 0.06.sw,
                  ),
                ),
                MyTextFormField(
                  hintText: 'Full Name',
                  validator: (String? value) {
                    const pattern = r"^[^-\s][A-Za-z\'\s\.\,]+$";
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter Your Name';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Invalid Name';
                    }
                    return null;
                  },
                ),

                MyTextFormField(
                  hintText: 'Email',
                  validator: (String? value) {
                    email=value!;
                    const pattern =
                    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
                    RegExp regExp = new RegExp(pattern);
                    if (value.isEmpty) {
                      return 'Enter Your Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Invalid  Email';
                    }
                    return null;
                  },
                ),

                MyTextFormField(
                  hintText: 'Password',
                  isPassword: true,
                  validator: (String? value) {
                    password=value!;
                    const pattern =
                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
                    RegExp regExp = new RegExp(pattern);
                    if (value.isEmpty) {
                      return 'Enter Your password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Password should contain at least one uppercase letter, one lowercase letter, one number, and one special character.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10), // Add some space below the TextFormField

                MyTextFormField(
                  hintText: 'Confirm password',
                  isPassword: true,
                  validator: (String? value) {
                    // RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter Your password';
                    } else if (value!=password) {
                      return 'password and confirm password dose not match';
                    }
                    else {
                      return null;
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password
                ).then((value) async {
                  sharedPreferenceForLogin();
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('logged', true);

                  var firebaseUser = FirebaseAuth.instance.currentUser;
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(firebaseUser!.uid)
                      .set({'userId': firebaseUser.uid,
                    'userDetails':{
                      'userName':fullName,
                      'email':email,
                    },
                    'FavObject':{
                        'fav':[]
                    }
                  },
                      SetOptions(merge: true)).then((value) async => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ProductPage())),
                  });
                });
              } on FirebaseAuthException catch (e) {
                if (e.code == 'email-already-in-use') {
                  Fluttertoast.showToast(
                      msg: "The account already exists for that email.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1);
                }
              } catch (e) {
                print(e);
              }            }
          },
          child: Container(
            width: 1.sw,
            height: .12.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Theme.of(context).textTheme.headline6!.color,
                ),
              ),
            ),
          ),
        ),
      ),    );
  }
}


sharedPreferenceForLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('logged', true);
  prefs.setBool('admin', false);
}