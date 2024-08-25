import 'package:e_commerce/features/authenication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find(); // Learn

  /// -- Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// -- Update Current Index when page scrolls
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// -- Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// -- Update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // Override the [isFirstTime] var to false in memory
      final storage = GetStorage();

      storage.write('isFirstTime', false);

      if (kDebugMode) {
        print('================= GET STORAGE===================');
        print(storage.read('isFirstTime'));
      }

      // Navigate to the next login screen
      Get.offAll(() => const LoginScreen());
    } else {
      currentPageIndex.value += 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// -- Update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
