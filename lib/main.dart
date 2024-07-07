import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:task/loginAndSIgnup/loginPage.dart';
import 'package:task/productPages/productPage.dart';

import 'injection.dart';

void main() async {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context,child){
      return FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              User? user = snapshot.data;
              // There's a user logged in
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ProductPage(),
              );
            } else {
              // No user logged in
              return MaterialApp(
                theme: ThemeData(),
                debugShowCheckedModeBanner: false,
                home: LoginPage(),
              );
            }
          }
        },
      );
    });
  }
}

