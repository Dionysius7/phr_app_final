import 'dart:convert';

import 'package:get/get.dart';
import 'package:phr_app_final/const.dart';
import 'package:phr_app_final/models/notification.dart';
import 'package:phr_app_final/service.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
// import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {
  var allNotification = <NotifModel>[].obs;
  RxList<NotifModel> dataHistory = <NotifModel>[].obs;
  RxList<NotifModel> dataNotification = <NotifModel>[].obs;
  var service = new Service();
  var constant = new Const();

  Future<String> fetchNotifData() async {
    final phrId = UserPreferences.getPatientId();

    var response = await service.getAllNotifData(constant.phrNotifGet, phrId);
    if (response.statusCode == 200) {
      var notifData = notifModelFromJson(response.body);
      allNotification.value = notifData;
      print(response.statusCode);
      print(allNotification.length);
      return response.statusCode.toString();
    } else {
      //Empty = 400?
      print(response.statusCode);
      return response.statusCode.toString();
    }
  }

  void checkStatus() {
    //Biar gak double datanya
    dataNotification.clear();
    dataHistory.clear();
    for (var item in allNotification) {
      if (item.status == "pending") {
        dataNotification.add(item);
      } else {
        dataHistory.add(item);
      }
    }
  }

  Future updateNotifStatus(status, id) async {
    var response =
        await service.updatePHRNotifStatus(constant.phrNotifUpdate, status, id);
    print(response.body);
    print(response.statusCode);
    var result = jsonDecode(response.body);
    print(result);

    if (response.statusCode == 200) {
      return result['data'];
    } else {
      return result['message'];
    }
  }
}
