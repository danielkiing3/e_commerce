import 'package:e_commerce/features/authenication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authenication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authenication/screens/signup/signup.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/validators/validation.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwSections),
        child: Column(
          children: [
            /// -- Email
            TextFormField(
              controller: controller.email,
              validator: (value) => UValidator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(UTexts.email),
              ),
            ),

            const SizedBox(height: USizes.spaceBtwInputFields),

            /// -- Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => UValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  label: const Text(UTexts.password),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
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
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
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
                onPressed: () => controller.emailAndPasswordSignIn(),
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
