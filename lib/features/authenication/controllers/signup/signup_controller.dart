import 'package:e_commerce/data/repositories/authenication/authenication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authenication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/shop/models/users/user_model.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/loader.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// -- Variables
  final hidePassword = true.obs; // Obversable for hiding/showing password
  final privacyPolicy = false.obs; // Obversable for privacy policy toggle
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastname input
  final userName = TextEditingController(); // Controller for username input
  final firstName = TextEditingController(); // Controller for firstname input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for sign up validation

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      UFullScreenLoaders.openLoadingDialog(
          'We are processing your information', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        UFullScreenLoaders.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove loader
        UFullScreenLoaders.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        // Remove loader
        UFullScreenLoaders.stopLoading();

        Get.closeAllSnackbars(); // Close any existing snack bar
        ULoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      // Register user in the firebase authenication & Save user data in the Firebase
      final userCredential = await AuthenicationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenicated user in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      UFullScreenLoaders.stopLoading();

      // Show success messsage
      ULoaders.successSnackBar(
          title: "Congratulations",
          message:
              'Your account has been created! Verify your email to continue');

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      UFullScreenLoaders.stopLoading();

      // Show general error to the user
      Get.closeAllSnackbars();
      ULoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
