import 'package:allyyuegbk/Screens/Auth%20Screens/LogIn.dart';
import 'package:allyyuegbk/Screens/bottomNavigationBar.dart';
import 'package:allyyuegbk/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/Images/Logo.png',
        nextScreen:  sharedPreferences.getString('id')==null?LoginScreen():Bar(),
        duration: 5000,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 300,



      ),
    );
  }
}

