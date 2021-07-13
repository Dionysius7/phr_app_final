import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/views/menu/condition_page.dart';
import 'package:phr_app_final/views/menu/history_page.dart';
import 'package:phr_app_final/views/menu/home_page.dart';
import 'package:phr_app_final/views/menu/profile_page.dart';
import 'package:phr_app_final/views/menu/qr_page.dart';

class MenuController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> listpage = [
    HomePage(),
    HistoryPage(),
    QRPage(),
    ConditionPage(),
    ProfilePage(),
  ];

  selectIndex(index) {
    selectedIndex.value = index;
  }
}
