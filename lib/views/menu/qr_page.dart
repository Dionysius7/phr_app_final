import 'package:flutter/material.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
import 'package:phr_app_final/views/menu/notification_page.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:get_storage/get_storage.dart';

class QRPage extends StatelessWidget {
  // final sessionData = GetStorage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          shadowColor: Color(0xFF494da0),
          backgroundColor: Color(0xFF494da0),
          title: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text("QR Scan"),
          ),
        ),
        body: Container(
            color: Color(0xFFe2e7f1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.all(20.0),
                  height: size.height / 1.2,
                  width: size.width,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff494da0), Color(0xff5a96d1)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/splash_image_2.png',
                            width: size.width / 2.5,
                          ),
                          SizedBox(
                            height: size.height / 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(color: Color(0xff494da0))),
                            padding: EdgeInsets.all(4),
                            child: QrImage(
                              data: UserPreferences.getPatientId().toString(),
                              version: QrVersions.auto,
                              size: MediaQuery.of(context).size.width / 2,
                              gapless: false,
                              errorCorrectionLevel: QrErrorCorrectLevel.H,
                              // embeddedImage: AssetImage(
                              //     "assets/logo_with_background_3.png"),
                              // embeddedImageStyle: QrEmbeddedImageStyle(
                              //   size: Size(60, 60),
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Text(
                            "SCAN ME!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],
            )));
  }
}
