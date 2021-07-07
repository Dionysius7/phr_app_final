import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phr_app_final/views/intro_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
          Stack(
            children: [
              Image.asset('assets/splash_image.png'),
              Text("HELLO GUYS")
            ]
        )
      ),
    );
  }
}
