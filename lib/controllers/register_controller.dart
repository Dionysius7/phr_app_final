import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:phr_app_final/const.dart';
import 'package:phr_app_final/models/user.dart';
import 'package:phr_app_final/service.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phr_app_final/views/login_page.dart';

class RegisterController extends GetxController {
  RxString selectedGender = "Male".obs;
  RxString selectedDate = "".obs;
  RxBool checkedBox = false.obs;
  List genderList = ["Male", "Female"];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController bpjsController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var service = new Service();
  var constant = new Const();
  List<UserModel> patient = <UserModel>[].obs;

  void setSelectedGender(String value) {
    selectedGender.value = value;
  }

  void setBirthDate(String val) {
    selectedDate.value = val;
  }

  void setCheckBox(bool val) {
    checkedBox.value = val;
  }

  Future<String> postPatientData() async {
    UserModel uModel = UserModel(
      address: Address(text: addressController.text),
      birthdate: DateFormat("yyyy-MM-dd").parse(selectedDate.value.toString()),
      extension: Extension(
          bpjs: Bpjs(
              system: constant.bpjsSystem, valueString: bpjsController.text),
          nik:
              Nik(system: constant.nikSystem, valueString: nikController.text)),
      gender: Gender(
          code: selectedGender.value.toLowerCase(),
          display: selectedGender.value,
          system: constant.genderSystem),
      name: Address(text: nameController.text),
      resourceType: "Patient",
      telecom: Telecom(value: phoneController.text),
    );
    try {
      var url = Uri.parse(constant.phrPatientPost);
      EasyLoading.show(
          status: "Uploading ...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);
      var response =
          await service.postPatientData(url, jsonEncode(uModel.toJson()));
      var result = jsonDecode(response.body);

      if (response.statusCode == 201) {
        EasyLoading.showSuccess("Success!",
            duration: Duration(milliseconds: 3000));
        EasyLoading.dismiss();
        Get.off(LoginPage());
        return result['message'];
      } else {
        EasyLoading.showError("Error", duration: Duration(milliseconds: 3000));
        EasyLoading.dismiss();
        return result['error']['0']['msg'];
      }
    } catch (e) {
      EasyLoading.showError("Error $e", duration: Duration(milliseconds: 3000));
      EasyLoading.dismiss();
      print("Post Data Error -> $e");
      return e.toString();
    }
  }
}
