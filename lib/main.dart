import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:phr_app_final/themes.dart';
import 'package:phr_app_final/views/intro_page.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff494da0), // this one
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final sessionData = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(
          //Customize Datepicker Colors
          colorScheme: ColorScheme.light(primary: Color(0xFF494da0)),
          // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        builder: EasyLoading.init());
  }
}
