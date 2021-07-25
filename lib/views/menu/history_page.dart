import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/controllers/notification_controller.dart';
import 'package:phr_app_final/views/menu/menu_page.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
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
          child: Text("History"),
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
                        if (notificationController.dataHistory.isEmpty) {
                          return Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/empty_history_page.png",
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
                                    "There is no history for now",
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
                              padding: EdgeInsets.only(bottom: 80),
                              itemCount:
                                  notificationController.dataHistory.length,
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
                                                            .dataHistory[index]
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
                                                      '${DateFormat("dd-MM-yyyy").format(DateFormat("yyyy-MM-dd").parse(notificationController.dataHistory[index].timestamp.toString()))}',
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          '${notificationController.dataHistory[index].hospitalName}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .grey[800],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'requesting your ${notificationController.dataHistory[index].type} data',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.grey[500],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    notificationController
                                                                .dataHistory[
                                                                    index]
                                                                .status! ==
                                                            "reject"
                                                        ? Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        15),
                                                            width:
                                                                size.width / 2,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "REJECTED",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            width:
                                                                size.width / 2,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "CONFIRMED",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
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
                                "assets/empty_history_page.png",
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
                                  "There is no history for now",
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
