import 'package:flutter/widgets.dart';
import 'package:phr_app_final/models/slider_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class SliderController extends GetxController{
  
  var currentIndex = 0.obs;
  bool get isLastPage => currentIndex.value == introPages.length - 1;
  var pageController = PageController();

  forwardAction(){
    if(isLastPage){
      //go to homepage
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeInQuad);
    }
  }

  List<SliderModel> introPages = [
    SliderModel('assets/intro_1.png','High Speed App','Manage your medical data faster with our technology'),
    SliderModel('assets/intro_2.png','Ease of Access','Access your medical data easily anytime and anywhere'),
    SliderModel('assets/intro_3.png','Widely Connected','Connect your medical data across various healthcare system'),
  ];
}