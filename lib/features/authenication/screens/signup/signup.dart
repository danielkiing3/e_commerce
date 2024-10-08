import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce/features/authenication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Title
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              /// -- Space between sessions
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// -- Form
              const USignupForm(),
              const SizedBox(height: USizes.spaceBtwSections),

              /// -- Divider
              UFormDivider(dividerText: UTexts.orSignInWith.capitalize!),
              const SizedBox(height: USizes.spaceBtwSections),

              /// Social button
              const USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
