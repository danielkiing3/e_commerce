import 'package:e_commerce/data/repositories/authenication/authenication_repository.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/loader.dart';
import 'package:e_commerce/utils/popups/full_screen_loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  final hidePassword = true.obs; // Obversable for remember me toggle
  final rememberMe = false.obs; // Obversable for hiding/showing password
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(); // Form key for Login Validation

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      UFullScreenLoaders.openLoadingDialog(
          'Logging you in......', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        UFullScreenLoaders.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove loader
        UFullScreenLoaders.stopLoading();
        return;
      }

      // Save Data if Remember Me is toggled
      if (rememberMe.value) {
        // Using an encrypted storage
        await secureStorage.write(
            key: 'REMEMBER_ME_EMAIL', value: email.text.trim());
        await secureStorage.write(
            key: 'REMEMBER_ME_PASSWORD', value: password.text.trim());
      }

      await AuthenicationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Stop Loading
      UFullScreenLoaders.stopLoading();

      AuthenicationRepository.instance.screenRedirect();
    } catch (e) {
      print(e.toString());
      UFullScreenLoaders.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
