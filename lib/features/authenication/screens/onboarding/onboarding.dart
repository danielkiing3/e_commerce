import 'package:e_commerce/features/authenication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authenication/screens/onboarding/widgets/onboading_skip.dart';
import 'package:e_commerce/features/authenication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce/features/authenication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce/features/authenication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController()); // Learn

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Widget
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UImages.onBoardingImage1,
                title: UTexts.onBoardingTitle1,
                subtitle: UTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage2,
                title: UTexts.onBoardingTitle2,
                subtitle: UTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage3,
                title: UTexts.onBoardingTitle3,
                subtitle: UTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothIndicator
          const OnboardingDotNavigation(),

          // Circular Button
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
