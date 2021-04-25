import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/app_gradients.dart';
import 'package:nlw_quiz/core/app_images.dart';
import 'package:nlw_quiz/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then((_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));

    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
        decoration: BoxDecoration(gradient: AppGradients.linear),
      ),
    );
  }
}
