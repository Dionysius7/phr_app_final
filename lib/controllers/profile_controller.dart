import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:phr_app_final/views/login_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  // final sessionData = GetStorage();
  static final whatsappUrl =
      "https://api.whatsapp.com/send?phone=6287808782609&text=Halo%20Developer%20Dapat%20Link%20Dari%20PHR%20App%20Nih%20HEHE";
  Uri contactUrl = Uri.parse(whatsappUrl);

  logoutUser() async {
    await UserPreferences.removePatientCredentials();
    UserPreferences.setIsLoggedStatus(false);

    Get.offAll(LoginPage());
    EasyLoading.showToast("Log out successful",
        toastPosition: EasyLoadingToastPosition.bottom);
  }

  Future<void> callContact(String phoneNumber) async {
    await launch('tel:$phoneNumber');
  }
}
