import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:phr_app_final/models/user.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
import 'package:phr_app_final/views/menu/home_page.dart';
import 'package:phr_app_final/views/menu/menu_page.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:phr_app_final/controllers/patient_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginController extends GetxController {
  final patientDataController = Get.put(PatientController());
  var phoneNumber = "";
  // final sessionData = GetStorage();
  var verificationCode = "";

  void setPhoneNumber(String numbers) {
    phoneNumber = numbers;
    verifyPhone();
  }

  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        // ignore: unnecessary_brace_in_string_interps
        phoneNumber: '+62${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          EasyLoading.show(
              status: "Loading...", maskType: EasyLoadingMaskType.black);
          List<UserModel> data = await patientDataController
              .fetchPatientByPhone(phoneNumber.toString());
          EasyLoading.dismiss();
          if (data.isEmpty) {
            // Keluarin Snackbar / Alert Kalau user belum terdaftar
            EasyLoading.showToast("Patient Not Registered",
                toastPosition: EasyLoadingToastPosition.center);
          } else {
            setSessionData(data);
            await FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) async {
              if (value.user != null) {
                Get.offAll(MenuPage());
              }
            });
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationCode = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
        },
        timeout: Duration(seconds: 120));
  }

  submitPinLogin(pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode, smsCode: pin))
          .then((value) async {
        EasyLoading.show(
            status: "Loading...", maskType: EasyLoadingMaskType.black);
        List<UserModel> data = await patientDataController
            .fetchPatientByPhone(phoneNumber.toString());
        EasyLoading.dismiss();
        if (data.isEmpty) {
          // Keluarin Snackbar / Alert Kalau user belum terdaftar
          EasyLoading.showToast("Patient Not Registered",
              toastPosition: EasyLoadingToastPosition.center);
        } else {
          setSessionData(data);
          if (value.user != null) {
            EasyLoading.showToast("Logged In",
                toastPosition: EasyLoadingToastPosition.center);
            Get.offAll(MenuPage());
          }
        }
      });
    } catch (e) {
      // Keluarin Snackbar / Alert Kalau invalid OTP
      EasyLoading.showToast("Invalid OTP Code, $e",
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  setSessionData(data) {
    final patientId = data[0].phrId.toString();
    final patientName = data[0].name!.text.toString();
    final patientGender = data[0].gender!.display.toString();
    final patientNik = data[0].extension!.nik!.valueString.toString();
    final patientBpjs = data[0].extension!.bpjs!.valueString.toString();
    final patientBirthDate = data[0].birthdate.toString();
    final patientPhoneNumber = data[0].telecom!.value.toString();
    final patientAddress = data[0].address!.text.toString();
    final patientMemberSince = data[0].timestamp.toString();

    // sessionData.write("isLogged", "true");
    // sessionData.write("patientId", patientId);
    // sessionData.write("patientName", patientName);
    // sessionData.write("patientGender", patientGender);
    // sessionData.write("patientNik", patientNik);
    // sessionData.write("patientBpjs", patientBpjs);
    // sessionData.write("patientBirthDate", patientBirthDate);
    // sessionData.write("patientPhoneNumber", patientPhoneNumber);
    // sessionData.write("patientAddress", patientAddress);
    // sessionData.write("patientMemberSince", patientMemberSince);

    UserPreferences.setIsLoggedStatus(true);
    UserPreferences.setPatientId(patientId);
    UserPreferences.setPatientName(patientName);
    UserPreferences.setPatientGender(patientGender);
    UserPreferences.setPatientNik(patientNik);
    UserPreferences.setPatientBpjs(patientBpjs);
    UserPreferences.setPatientBirthDate(patientBirthDate);
    UserPreferences.setPatientPhoneNumber(patientPhoneNumber);
    UserPreferences.setPatientAddress(patientAddress);
    UserPreferences.setPatientMemberSince(patientMemberSince);
  }
}
