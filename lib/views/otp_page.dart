import 'package:flutter/material.dart';
import 'package:phr_app_final/controllers/login_controller.dart';
import 'package:phr_app_final/controllers/patient_controller.dart';
import 'package:phr_app_final/models/user.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  final patientDataController = Get.put(PatientController());
  final loginController = Get.put(LoginController());
  final sessionData = GetStorage();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.indigo[200],
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.indigo,
    ),
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldkey,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/otp_image.png",
                            width: width / 1.5, height: height / 3.5)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter the OTP code sent to:",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text("${loginController.phoneNumber}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: PinPut(
                        fieldsCount: 6,
                        withCursor: true,
                        textStyle: const TextStyle(
                            fontSize: 25.0, color: Colors.white),
                        eachFieldWidth: width / 8,
                        eachFieldHeight: height / 16,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.fade,
                        onSubmit: (pin) async {
                          await loginController.submitPinLogin(pin);
                        }),
                  ),
                  Container(
                      width: width / 1.5,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: MaterialButton(
                        color: Colors.indigo,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(13),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35)),
                        onPressed: () {},
                        child: Text(
                          "Verify",
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height / 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/top_right_decoration.png")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
