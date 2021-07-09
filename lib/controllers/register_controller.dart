import 'package:get/state_manager.dart';

class RegisterController extends GetxController {
  RxString selectedGender = "Male".obs;
  RxString selectedDate = "".obs;
  RxBool checkedBox = false.obs;

  void setSelectedGender(String value) {
    selectedGender.value = value;
  }

  void setBirthDate(String val) {
    selectedDate.value = val;
  }

  void setCheckBox(bool val) {
    checkedBox.value = val;
  }

  List genderList = ["Male", "Female"];
}
