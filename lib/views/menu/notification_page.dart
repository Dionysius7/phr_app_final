import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/controllers/notification_controller.dart';
import 'package:phr_app_final/views/menu/menu_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Color(0xFF494da0),
        backgroundColor: Color(0xFF494da0),
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text("Notifications"),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          color: Color(0xFFe2e7f1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                  future: notificationController.fetchNotifData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == "200") {
                        notificationController.checkStatus();
                        if (notificationController.dataNotification.isEmpty) {
                          return Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/empty_notif_page.png",
                                  width: size.width / 1.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Nothing here...",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    "There is no notifications for now",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  width: size.width / 1.5,
                                  child: MaterialButton(
                                      onPressed: () {
                                        Get.offAll(MenuPage());
                                      },
                                      child: Text("Back to home"),
                                      color: Color(0xFF494da0),
                                      textColor: Colors.white,
                                      padding: EdgeInsets.all(15),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(35))),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: notificationController
                                  .dataNotification.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        //Left Side
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // color: Colors.red,
                                            padding: EdgeInsets.all(15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                notificationController
                                                            .dataNotification[
                                                                index]
                                                            .type ==
                                                        "patient"
                                                    ? Image.asset(
                                                        "assets/item_patient.png",
                                                        width: size.width / 5,
                                                      )
                                                    : Image.asset(
                                                        "assets/item_condition.png",
                                                        width: size.width / 5,
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //Right Side
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${DateFormat("dd-MM-yyyy").format(DateFormat("yyyy-MM-dd").parse(notificationController.dataNotification[index].timestamp.toString()))}',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    '${notificationController.dataNotification[index].hospitalName}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'requesting your ${notificationController.dataNotification[index].type} data',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: size.width / 4,
                                                      child: MaterialButton(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      size.width /
                                                                          15),
                                                          onPressed: () async {
                                                            EasyLoading.show(
                                                                status:
                                                                    "Loading...",
                                                                maskType:
                                                                    EasyLoadingMaskType
                                                                        .black);
                                                            await notificationController.updateNotifStatus(
                                                                "confirm",
                                                                notificationController
                                                                    .dataNotification[
                                                                        index]
                                                                    .notificationId
                                                                    .toString());
                                                            EasyLoading
                                                                .dismiss();
                                                          },
                                                          child: Text("Confirm",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                          color: Colors.green,
                                                          textColor:
                                                              Colors.white,
                                                          shape: new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      35))),
                                                    ),
                                                    SizedBox(
                                                      width: size.width / 50,
                                                    ),
                                                    Container(
                                                      width: size.width / 4,
                                                      child: MaterialButton(
                                                          onPressed: () async {
                                                            EasyLoading.show(
                                                                status:
                                                                    "Loading...",
                                                                maskType:
                                                                    EasyLoadingMaskType
                                                                        .black);
                                                            await notificationController.updateNotifStatus(
                                                                "reject",
                                                                notificationController
                                                                    .dataNotification[
                                                                        index]
                                                                    .notificationId
                                                                    .toString());
                                                            EasyLoading
                                                                .dismiss();
                                                          },
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      size.width /
                                                                          15),
                                                          child: Text("Reject"),
                                                          color: Colors.red,
                                                          textColor:
                                                              Colors.white,
                                                          shape: new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      35))),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      } else {
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/empty_notif_page.png",
                                width: size.width / 1.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  "Nothing here...",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  "There is no notifications for now",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15.0),
                                width: size.width / 1.5,
                                child: MaterialButton(
                                    onPressed: () {
                                      Get.offAll(MenuPage());
                                    },
                                    child: Text("Back to home"),
                                    color: Color(0xFF494da0),
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(15),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(35))),
                              )
                            ],
                          ),
                        );
                      }
                    } else {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
