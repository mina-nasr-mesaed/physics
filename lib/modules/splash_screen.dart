import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigateToHome(context, 'loginScreen');
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/splashscreen.png',
            fit: BoxFit.fill,
          ),
        ));
  }
  void NavigateToHome(BuildContext context, String ScreenName) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, ScreenName);
    });
  } //NavigateToHome
}