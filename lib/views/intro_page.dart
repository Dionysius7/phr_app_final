import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:phr_app_final/controllers/slider_controller.dart';

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
                      Image.asset(_controller.introPages[index].image, width: width/1.1, height: height/2.5),
                      SizedBox(height: height/20),
                      Text(_controller.introPages[index].title, style: TextStyle(fontSize: width/13, fontWeight: FontWeight.bold),),
                      SizedBox(height: height/40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text(_controller.introPages[index].desc, textAlign: TextAlign.center),
                      )
                    ],
                  ),
                );
              }
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  List.generate(_controller.introPages.length, (index) => Obx(() {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: (index == _controller.currentIndex.value) ? 30 : 10,
                          height: 10,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(color: (index == _controller.currentIndex.value) ? Colors.indigo : Colors.grey, borderRadius: BorderRadius.circular(35)),
                        );
                      }),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}