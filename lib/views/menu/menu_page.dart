import 'package:flutter/material.dart';
import 'package:phr_app_final/controllers/menu_controller.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  final menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: Stack(
            children: [
              Obx(() => menuController.listpage
                  .elementAt(menuController.selectedIndex.value)),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                    width: width,
                    height: 80,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(width, 80),
                          painter: BnBCustomPainter(),
                        ),
                        Center(
                          heightFactor: 0.6,
                          child: FloatingActionButton(
                            focusColor: Colors.red,
                            onPressed: () {
                              menuController.selectIndex(2);
                            },
                            backgroundColor: Color(0xFF494da0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF494da0).withOpacity(0.3),
                                      spreadRadius: 20,
                                      blurRadius: 7,
                                    )
                                  ]),
                              child: Icon(
                                Icons.qr_code_scanner,
                                size: 35,
                              ),
                            ),
                            foregroundColor: Colors.white,
                            elevation: 5,
                          ),
                        ),
                        Container(
                          width: width,
                          height: 80,
                          child: Obx(() => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      menuController.selectIndex(0);
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.home),
                                              padding: EdgeInsets.only(top: 10),
                                              tooltip: "Home",
                                              color: menuController
                                                          .selectedIndex
                                                          .value ==
                                                      0
                                                  ? Color(0xFF494da0)
                                                  : Colors.grey[500],
                                              onPressed: () {
                                                menuController.selectIndex(0);
                                              }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Home",
                                                  style: TextStyle(
                                                    fontWeight: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            0
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    color: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            0
                                                        ? Color(0xFF494da0)
                                                        : Colors.grey[500],
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      menuController.selectIndex(1);
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.article),
                                              padding: EdgeInsets.only(top: 10),
                                              tooltip: "History",
                                              color: menuController
                                                          .selectedIndex
                                                          .value ==
                                                      1
                                                  ? Color(0xFF494da0)
                                                  : Colors.grey[500],
                                              onPressed: () {
                                                menuController.selectIndex(1);
                                              }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("History",
                                                  style: TextStyle(
                                                    fontWeight: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            1
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    color: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            1
                                                        ? Color(0xFF494da0)
                                                        : Colors.grey[500],
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(width: width * 0.20),
                                  InkWell(
                                    onTap: () {
                                      menuController.selectIndex(3);
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon:
                                                  Icon(Icons.medical_services),
                                              padding: EdgeInsets.only(top: 10),
                                              tooltip: "Condition",
                                              color: menuController
                                                          .selectedIndex
                                                          .value ==
                                                      3
                                                  ? Color(0xFF494da0)
                                                  : Colors.grey[500],
                                              onPressed: () {
                                                menuController.selectIndex(3);
                                              }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Condition",
                                                  style: TextStyle(
                                                    fontWeight: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            3
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    color: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            3
                                                        ? Color(0xFF494da0)
                                                        : Colors.grey[500],
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      menuController.selectIndex(4);
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.account_circle),
                                              padding: EdgeInsets.only(top: 10),
                                              tooltip: "Profile",
                                              color: menuController
                                                          .selectedIndex
                                                          .value ==
                                                      4
                                                  ? Color(0xFF494da0)
                                                  : Colors.grey[500],
                                              onPressed: () {
                                                menuController.selectIndex(4);
                                              }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Profile",
                                                  style: TextStyle(
                                                    fontWeight: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            4
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    color: menuController
                                                                .selectedIndex
                                                                .value ==
                                                            4
                                                        ? Color(0xFF494da0)
                                                        : Colors.grey[500],
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

class BnBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 50, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
