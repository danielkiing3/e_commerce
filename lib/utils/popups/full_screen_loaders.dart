import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Utility class for managing full screen loading dialog
class UFullScreenLoaders {
  /// Private constructor to prevent instantiation.
  UFullScreenLoaders._();

  /// Opens a full-screen loading dialog with a specified animation and text.
  ///
  /// Parameters:
  /// - [text]: The text to be displayed below the loading animation.
  /// - [animation]: The path to the Lottie animation file.
  ///
  /// The dialog is modal and non-dismissible by the user. It covers the entire screen,
  /// with a background color that adapts to the current theme (dark or light mode).
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      useSafeArea: false,
      builder: (_) => PopScope(
        canPop:
            false, // Prevents the dialog from being closed using the back button
        child: Container(
          // Set background color based on the current theme
          color: UHelperFunctions.isDarkMode(Get.context!)
              ? UColors.dark
              : UColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              UAnimationLoader(
                text: text,
                animation: animation,
              ), // Display the loading animation with text
            ],
          ),
        ),
      ),
    );
  }

  /// Closes the currently open full-screen loading dialog.
  ///
  /// This method dismisses the dialog that was opened using [openLoadingDialog].
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
