import 'package:e_commerce/data/repositories/authenication/authenication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/loader.dart';
import 'package:e_commerce/utils/popups/full_screen_loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables

  // Instance of FlutterSecureStorage for securely storing data
  final secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));

  // Controllers for handling email and password input fields
  final email = TextEditingController();
  final password = TextEditingController();

  // Observable variables for toggling password visibility and remembering credentials
  final hidePassword = true.obs;
  final rememberMe = false.obs;

  // Key for managing and validating the login form
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // User Controller
  final userController = Get.put(UserController());

  @override
  void onInit() async {
    // Initialize the email and password fields with saved data if available
    email.text = await secureStorage.read(key: 'REMEMBER_ME_EMAIL') ?? '';
    password.text = await secureStorage.read(key: 'REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email and Password Sign In
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

      // Save email and password if the "Remember Me" option is selected
      if (rememberMe.value) {
        await secureStorage.write(
            key: 'REMEMBER_ME_EMAIL', value: email.text.trim());
        await secureStorage.write(
            key: 'REMEMBER_ME_PASSWORD', value: password.text.trim());
      } else {
        // Clear saved email and password if "Remember Me" is not selected
        await secureStorage.write(key: 'REMEMBER_ME_EMAIL', value: '');
        await secureStorage.write(key: 'REMEMBER_ME_PASSWORD', value: '');
      }

      // Attempt to sign in with email and password
      await AuthenicationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Stop Loading
      UFullScreenLoaders.stopLoading();

      AuthenicationRepository.instance.screenRedirect();
    } catch (e) {
      UFullScreenLoaders.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Google Sign In
  Future<void> googleSignIn() async {
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

      // Google Authenication
      final userCredential =
          await AuthenicationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredential);

      // Remove loader
      UFullScreenLoaders.stopLoading();

      // Redirect
      AuthenicationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UFullScreenLoaders.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Facebook Sign In
  Future<void> facebookSignIn() async {
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

      // Facebook Authenication
      final userCredential =
          await AuthenicationRepository.instance.signInWithFacebook();

      // Save user record
      await userController.saveUserRecord(userCredential);

      // Remove loader
      UFullScreenLoaders.stopLoading();

      // Redirect
      AuthenicationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UFullScreenLoaders.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
