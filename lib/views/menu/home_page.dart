import 'package:flutter/material.dart';
import 'package:phr_app_final/controllers/home_controller.dart';
import 'package:phr_app_final/controllers/notification_controller.dart';
import 'package:phr_app_final/utils/user_preferences.dart';
import 'package:phr_app_final/views/menu/notification_page.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  // final sessionData = GetStorage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeController = Get.put(HomeController());
    final notificationController = Get.put(NotificationController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: FutureBuilder(
                future: notificationController.fetchNotifData(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    notificationController.checkStatus();

                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: notificationController.dataNotification.length == 0
                          ? Image.asset(
                              'assets/item_notif_empty.png',
                              width: size.width / 20,
                            )
                          : Image.asset(
                              'assets/item_notif.png',
                              width: size.width / 20,
                            ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset(
                        'assets/item_notif_empty.png',
                        width: size.width / 20,
                      ),
                    );
                  }
                },
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
            width: size.width,
            color: Color(0xFFe2e7f1),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      // color: Colors.red,
                      child: Image.asset(
                        "assets/home_decoration.png",
                        width: size.width,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height / 3.5,
                      // color: Colors.green,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                            width: size.width,
                            // color: Colors.yellow,
                            height: size.height / 4,
                            child: Card(
                              margin: EdgeInsets.only(top: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 2,
                              // color: Colors.red,
                              shadowColor: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.cyan,
                                    width: size.width / 1.2,
                                    height: size.height / 4.5,
                                    child: Column(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Color(0xFF494da0),
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text.rich(TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color(0xFF8385c0),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text: "Welcome back, "),
                                                    TextSpan(
                                                      text: UserPreferences
                                                          .getPatientName(),
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF494da0),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          // color: Colors.blue,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          // color: Colors.red,
                                          width: size.width / 1.2,
                                          height: size.height / 7,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  // color: Colors.blue,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      (UserPreferences
                                                                  .getPatientGender() ==
                                                              "Male")
                                                          ? Image.asset(
                                                              "assets/male_aura.png",
                                                              width:
                                                                  size.width /
                                                                      4,
                                                              height:
                                                                  size.height /
                                                                      10,
                                                            )
                                                          : Image.asset(
                                                              "assets/female_aura.png",
                                                              width:
                                                                  size.width /
                                                                      4,
                                                              height:
                                                                  size.height /
                                                                      10,
                                                            )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  // color: Colors.green,
                                                  child: Text(
                                                    "You look awesome today! Remember your meds and Check your health status.",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF494da0),
                                                        letterSpacing: 2,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //Bikin Slider Konten NEWS!
                Container(
                  margin: EdgeInsets.only(bottom: size.height / 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Health News",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          // color: Color(0xffc7c9e5),
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CarouselSlider(
                            items: homeController.health_imgList.map((imgUrl) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.network(
                                      imgUrl,
                                    ));
                              });
                            }).toList(),
                            options: CarouselOptions(
                              enlargeCenterPage: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(milliseconds: 3000),
                              autoPlayCurve: Curves.linear,
                            ),
                          )
                        ],
                      )),
                      Container(
                        // color: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Covid News",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          // color: Color(0xffc7c9e5),
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CarouselSlider(
                            items: homeController.covid_imgList.map((imgUrl) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.network(
                                      imgUrl,
                                    ));
                              });
                            }).toList(),
                            options: CarouselOptions(
                              enlargeCenterPage: false,
                              viewportFraction: 0.5,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayInterval: Duration(milliseconds: 3000),
                              autoPlayCurve: Curves.linear,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
