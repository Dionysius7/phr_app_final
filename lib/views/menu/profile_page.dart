import 'package:flutter/material.dart';
import 'package:phr_app_final/controllers/profile_controller.dart';
import 'package:phr_app_final/views/menu/notification_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final sessionData = GetStorage();
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          shadowColor: Color(0xFF494da0),
          backgroundColor: Color(0xFF494da0),
          title: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Image.asset(
              'assets/text_logo.png',
              width: size.width / 2,
            ),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Get.to(NotificationPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.notifications),
                ))
          ],
        ),
        body: Container(
            color: Color(0xFFe2e7f1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.all(20.0),
                  height: size.height / 1.6,
                  width: size.width,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (sessionData.read("patientGender") == "Male")
                              ? Image.asset(
                                  'assets/male_aura.png',
                                  width: size.width / 2.5,
                                )
                              : Image.asset(
                                  'assets/female_aura.png',
                                  width: size.width / 2.5,
                                ),
                          Text(sessionData.read("patientName"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff494da0),
                                fontSize: 20,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Table(
                              // border: TableBorder.all(),
                              columnWidths: {
                                0: FlexColumnWidth(2.0),
                                1: FlexColumnWidth(0.2),
                                2: FlexColumnWidth(3.0),
                              },
                              children: [
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Id",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(sessionData.read("patientId")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Phone",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(sessionData
                                            .read("patientPhoneNumber")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Gender",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(sessionData.read("patientGender")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Nik",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(sessionData.read("patientNik")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Bpjs",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(sessionData.read("patientBpjs")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Address",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            sessionData.read("patientAddress")),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Birthdate",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(DateFormat("yyyy-MM-dd").format(
                                            DateFormat("yyyy-MM-dd").parse(
                                                sessionData
                                                    .read("patientBirthDate")
                                                    .toString()))),
                                      ],
                                    ),
                                  ],
                                ),
                                TableRow(children: [
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                  SizedBox(height: size.height / 100),
                                ]),
                                TableRow(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Member Since",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(":"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(DateFormat("yyyy-MM-dd").format(
                                            DateFormat("yyyy-MM-dd").parse(
                                                sessionData
                                                    .read("patientMemberSince")
                                                    .toString()))),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  // color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 1.2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 15)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.indigo))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Contact Us"),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: size.width / 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            // launch(profileController.contactUrl.toString());
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 1.2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            shadowColor:
                                MaterialStateProperty.all(Colors.black),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 15)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.indigo))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Logout"),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: size.width / 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            profileController.logoutUser();
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
