import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'notification_controller.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final CarouselController carouselController = CarouselController();
  final notificationController = Get.put(NotificationController());

  // ignore: non_constant_identifier_names
  final List health_imgList = [
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fh1.jpg?alt=media&token=c5dd9eec-0666-4aca-95d9-7c71f8bdeed3",
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fh2.jpg?alt=media&token=0fc9625e-61ba-464e-a159-923fbf3d84cd",
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fh3.jpg?alt=media&token=b9586c84-ed2b-4761-935e-671661e759f7",
  ];
  // ignore: non_constant_identifier_names
  final List covid_imgList = [
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fc1.jpg?alt=media&token=1baaa5b6-e887-4d76-b992-f3cad54298d4",
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fc2.jpg?alt=media&token=30eccac0-9de5-4660-9157-601e3561ff92",
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fc3.jpg?alt=media&token=ad2dea61-6284-4387-99ca-f440baa19077",
    "https://firebasestorage.googleapis.com/v0/b/phr-api.appspot.com/o/avatar%2Fc4.jpg?alt=media&token=63a8c0c1-2e8b-44f8-9932-ed76c43f96f6",
  ];
}
