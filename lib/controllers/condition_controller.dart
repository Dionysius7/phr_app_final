import 'dart:convert';
import 'package:get/get.dart';
import 'package:phr_app_final/const.dart';
import 'package:phr_app_final/models/condition.dart';
import 'package:phr_app_final/service.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
// import 'package:get_storage/get_storage.dart';

class ConditionController extends GetxController {
  var condition = <ConditionModel>[].obs;
  var service = new Service();
  var constant = new Const();
  // GetStorage sessionData = GetStorage();

  Future<String> fetchConditionData() async {
    var response = await service.getAllConditionData(
        constant.phrConditionGet, UserPreferences.getPatientId());
    if (response.statusCode == 200) {
      var conditionData = conditionModelFromJson(response.body);
      condition.value = conditionData;
      return response.statusCode.toString();
    } else {
      print(response.statusCode);
      return response.statusCode.toString();
    }
  }
}
