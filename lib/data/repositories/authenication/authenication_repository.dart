import 'package:e_commerce/features/authenication/screens/login/login.dart';
import 'package:e_commerce/features/authenication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenicationRepository extends GetxController {
  static AuthenicationRepository get instance => Get.find();

  // Variable
  final deviceStorage = GetStorage();

  // Called from the main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove(); // Remove the Native Splash screen
    screenRedirect();
  }

  /// Function to show relevvant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  /* -------------------- Email & Password Sign in --------------------- */
  /// [EmailAuthenication] - SIGN IN
  /// [EmailAuthenication] - REGISTER
  /// [ReAuthenication] - REAUTHENICATE USERS
  /// [EmailAuthenication] - MAIL VERIFICATION
  /// [EmailAuthenication] - FORGET PASSWORD

  /* ---------------- Password identity & Social sign in ----------------- */
  /// [GoogleAuthenication] - GOOGLE
  /// [FacebookAuthenication] - FACEBOOK

  /* -------------------- Email & Password Sign in --------------------- */
  /// [Logout Users] - FACEBOOK
  /// [Delete User ] - FACEBOOK
}
