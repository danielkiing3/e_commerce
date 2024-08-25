import 'dart:async';

import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/data/repositories/authenication/authenication_repository.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// -- Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoDirect();
    super.onInit();
  }

  /// -- Send email verification link
  void sendEmailVerification() async {
    try {
      await AuthenicationRepository.instance.sendEmailVerification();

      Get.closeAllSnackbars();
      // Success Snackbar
      ULoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox or spam and verify your mail',
      );
    } catch (e) {
      // Error snackbar
      ULoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// -- Timer to automatically redirect an Email verification
  void setTimeForAutoDirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        // Cancel the ongoing timer
        timer.cancel();

        Get.off(
          () => SuccessScreen(
            image: UImages.successfullyRegisterAnimation,
            title: UTexts.yourAccountCreatedTitle,
            subtitle: UTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenicationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// -- Manually check if the email is verified
  void checkEmailVerifyScreen() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: UImages.successfullyRegisterAnimation,
          title: UTexts.yourAccountCreatedTitle,
          subtitle: UTexts.yourAccountCreatedSubTitle,
          onPressed: AuthenicationRepository.instance.screenRedirect,
        ),
      );
    } else {
      Get.closeAllSnackbars();
      ULoaders.warningSnackBar(
        title: 'Email Not Verified',
        message: 'Kindly check your email to reverify your email',
      );
    }
  }
}
