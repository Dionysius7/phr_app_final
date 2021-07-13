import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phr_app_final/views/login_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileController extends GetxController {
  final sessionData = GetStorage();
  static final whatsappUrl =
      "https://api.whatsapp.com/send?phone=6287808782609&text=Halo%20Developer%20Dapat%20Link%20Dari%20PHR%20App%20Nih%20HEHE";
  Uri contactUrl = Uri.parse(whatsappUrl);

  logoutUser() {
    sessionData.remove("patientId");
    sessionData.remove("patientName");
    sessionData.remove("patientGender");
    sessionData.remove("patientNik");
    sessionData.remove("patientBpjs");
    sessionData.remove("patientBirthDate");
    sessionData.remove("patientPhoneNumber");
    sessionData.remove(
      "patientAddress",
    );
    sessionData.remove("patientMemberSince");
    sessionData.remove("isLogged");
    Get.offAll(LoginPage());
    EasyLoading.showToast("Log out successful",
        toastPosition: EasyLoadingToastPosition.bottom);
  }
}