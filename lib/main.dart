import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
// import 'package:phr_app_final/themes.dart';
import 'package:phr_app_final/views/intro_page.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phr_app_final/views/login_page.dart';
import 'package:phr_app_final/views/menu/menu_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff494da0), // this one
    ),
  );
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final sessionData = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firstTime = true;
    print(firstTime);
    final isLogged = false;
    print(isLogged);
    // final isLogged = sessionData.read("isLogged") ?? false;
    // final firstTime = sessionData.read("firstTime") ?? true;

    if (firstTime == false && isLogged == true) {
      print('masuk kondisi 1 $firstTime $isLogged');
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MenuPage(),
          theme: ThemeData(
            //Customize Datepicker Colors
            colorScheme: ColorScheme.light(primary: Color(0xFF494da0)),
            // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          builder: EasyLoading.init());
    } else if (firstTime == false && isLogged == false) {
      print('masuk kondisi 2 $firstTime $isLogged');
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          theme: ThemeData(
            //Customize Datepicker Colors
            colorScheme: ColorScheme.light(primary: Color(0xFF494da0)),
            // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          builder: EasyLoading.init());
    } else {
      print('masuk kondisi 3 $firstTime $isLogged');
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(
          //Customize Datepicker Colors
          colorScheme: ColorScheme.light(primary: Color(0xFF494da0)),
          // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        builder: EasyLoading.init(),
      );
    }
  }
}
