import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/loginAndSIgnup/SignupPage.dart';
import 'package:task/productPages/productPage.dart';

import '../commanWidgets/myTextFormFeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String email = "";
  String password = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30.h,),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: .06.sw,
                          ),
                        ),
                        SizedBox(height: 30.h,),

                        Container(
                          width: .9.sw,
                          height:.7.sw,
                          child: SvgPicture.asset(
                            "assets/images/market.svg",
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                            width: .4.sw,
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        MyTextFormField(
                          refkey: Key('email'),
                          hintText: 'Email',
                          onchanged: (String? value) {
                            email != value;
                          },
                          validator: (String? value) {
                            email = value!;
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
                          refkey: Key('password'),
                          hintText: 'Password',
                          isPassword: true,
                          validator: (String? value) {
                            password = value!;
                            const pattern =
                                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return 'Enter Your password';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Invalid  password';
                            }
                            return null;
                          },
                          onchanged: (String? value) {
                            password != value;
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                              },
                              child: Text("Sign Up"),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  )
                      .then((value) async {
                    // sharedPreferenceForLogin();
                    // final prefs = await SharedPreferences.getInstance();
                    // await prefs.setBool('logged', true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(
                        msg: 'No user found for that email.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1);
                  } else if (e.code == 'wrong-password') {
                    print("wrong66666666");
                    Fluttertoast.showToast(
                        msg: 'Incorrect email or password.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1);
                  } else {
                    print("wrong66666666sdsdsd");
                    Fluttertoast.showToast(
                        msg: 'Incorrect email or password.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1);
                  }
                }
              }
            },
            child: Container(
              width: 1.sw,
              height: .12.sw,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.headline6!.color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
