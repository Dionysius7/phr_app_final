import 'package:flutter/material.dart';
import 'package:phr_app_final/views/intro_page.dart';
import 'package:phr_app_final/views/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage()
    );
  }
}
