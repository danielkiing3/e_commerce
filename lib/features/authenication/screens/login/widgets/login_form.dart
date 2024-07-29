import 'package:e_commerce/features/authenication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authenication/screens/signup/signup.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwSections),
        child: Column(
          children: [
            /// -- Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(UTexts.email),
              ),
            ),

            const SizedBox(height: USizes.spaceBtwInputFields),

            /// -- Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                label: Text(UTexts.password),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),

            const SizedBox(height: USizes.spaceBtwInputFields / 2),

            /// -- Remember me & Forget Passwor
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Remember Me
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text(UTexts.rememberMe),
                  ],
                ),

                /// -- Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(UTexts.forgetPassword),
                ),
              ],
            ),

            /// -- Space between sessions
            const SizedBox(height: USizes.spaceBtwSections),

            /// -- Sign Im Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(UTexts.signIn),
              ),
            ),

            /// -- Space between items
            const SizedBox(height: USizes.spaceBtwItems),

            /// Create Amount Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(UTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
