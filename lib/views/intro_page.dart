import 'package:flutter/material.dart';
import 'package:phr_app_final/controllers/slider_controller.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/views/login_page.dart';

class IntroPage extends StatelessWidget {
  final _controller = SliderController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.currentIndex,
              itemCount: _controller.introPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.introPages[index].image, width: width/1.1, height: height/3),
                      SizedBox(height: height/20),
                      Text(_controller.introPages[index].title, style: TextStyle(fontSize: width/13, fontWeight: FontWeight.w900, color: Colors.indigo[400]),),
                      SizedBox(height: height/40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text(_controller.introPages[index].desc, textAlign: TextAlign.center, style: TextStyle(fontSize: width/20, color: Colors.indigo[300], fontWeight: FontWeight.normal),),
                      )
                    ],
                  ),
                );
              }
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                      children: [
                          GestureDetector(
                            onTap: (){
                              _controller.forwardAction();
                            },
                            child: Obx(() {
                              return Text(_controller.isLastPage ? "" : "Skip", style: TextStyle(color: Colors.indigo[300], fontSize: 20, fontWeight: FontWeight.bold));
                              }
                          ))
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        List.generate(_controller.introPages.length, (index) => Obx(() {
                                if(_controller.isLastPage) {
                                  return Text("");
                                } else{
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: (index == _controller.currentIndex.value) ? 30 : 10,
                                    height: 10,
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(color: (index == _controller.currentIndex.value) ? Colors.indigo : Colors.indigo[100], borderRadius: BorderRadius.circular(35)),
                                  );
                                }
                            }),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              _controller.forwardAction();
                            },
                            child: Obx(() {
                              return Text(_controller.isLastPage ? "" : "Next", style: TextStyle(color: Colors.indigo[300], fontSize: 20, fontWeight: FontWeight.bold));
                              }
                          ))
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx( () {
                      if(_controller.isLastPage){
                        return ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),);
                            Get.off(LoginPage());
                          }, 
                          child: Text("Get Started", style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            elevation: 10,
                            padding: EdgeInsets.only(left: 20, right: 20, top:15, bottom: 15),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5))
                          )
                        );
                      } else {
                        return Text("");
                      }
                      }),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}