import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce/features/authenication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authenication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: USpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// -- Logo, Title and Sub-title
              const ULoginHeader(),

              /// -- Login Form
              const ULoginForm(),

              /// -- Dividers
              UFormDivider(
                dividerText: UTexts.orSignInWith.capitalize!,
              ),

              /// -- Space between sections
              const SizedBox(height: USizes.spaceBtwSections),

              /// -- Footer
              const USocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
