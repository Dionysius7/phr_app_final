import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:phr_app_final/const.dart';
import 'package:phr_app_final/models/user.dart';
import 'package:phr_app_final/service.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

class PatientController extends GetxController {
  var service = new Service();
  var constant = new Const();
  GetStorage sessionData = GetStorage();
  List<UserModel> patient = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  Future<List<UserModel>> fetchPatientByPhone(phone) async {
    final response =
        await service.getPatientDataByPhone(constant.phrLoginPatient, phone);
    if (response.statusCode == 200) {
      List<UserModel> patientData = userModelFromJson(response.body);
      return patient = patientData;
    } else {
      print(response.body);

      return [];
    }
  }
}
