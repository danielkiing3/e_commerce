import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  Rx<int> carouselCurrentIndex = 0.obs;

  void updatePageIndex(index) {
    carouselCurrentIndex.value = index;
  }
}
