import 'package:flutter/material.dart';
import 'package:nlw_quiz/core/app_gradients.dart';
import 'package:nlw_quiz/core/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
