import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget that displays an animated loading indicator with optional text and action button.
class UAnimationLoader extends StatelessWidget {
  /// Default constructor for [UAnimationLoader]
  ///
  /// Parameters:
  /// - [text]: The text to be displayed below the animation.
  /// - [animation]: The path to the lottie file.
  /// - [showAction]: Whether to show an action button below the text.
  /// - [actionText]: The text to be displayed in the action button
  /// - [onActionPressed]: Call back method to be executed when the action button is pressed
  const UAnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display Lottie Animation
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: USizes.defaultSpace),

          // Display the provided text
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: USizes.defaultSpace),

          // Optionally display the action button if showAction is true
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: UColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: UColors.light),
                    ),
                  ),
                )
              : const SizedBox() // If no action is needed, display an empty box
        ],
      ),
    );
  }
}
