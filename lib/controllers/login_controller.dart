import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:phr_app_final/models/user.dart';
import 'package:phr_app_final/views/home_page.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phr_app_final/controllers/patient_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginController extends GetxController {
  final patientDataController = Get.put(PatientController());
  var phoneNumber = "";
  final sessionData = GetStorage();
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
            final patientId = data[0].phrId;
            final patientName = data[0].name!.text;
            sessionData.write("patientName", patientName);
            sessionData.write("patientId", patientId);
            sessionData.write("isLogged", true);
            await FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) async {
              if (value.user != null) {
                Get.offAll(HomePage());
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
          final patientId = data[0].phrId;
          final patientName = data[0].name!.text;
          sessionData.write("patientName", patientName);
          sessionData.write("patientId", patientId);
          sessionData.write("isLogged", true);
          if (value.user != null) {
            EasyLoading.showToast("Logged In",
                toastPosition: EasyLoadingToastPosition.center);
            Get.offAll(HomePage());
          }
        }
      });
    } catch (e) {
      // Keluarin Snackbar / Alert Kalau invalid OTP
      EasyLoading.showToast("Invalid OTP Code, $e",
          toastPosition: EasyLoadingToastPosition.center);
    }
  }
}
