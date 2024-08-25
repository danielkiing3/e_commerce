import 'package:e_commerce/features/authenication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authenication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// -- First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  expands: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: UTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: USizes.spaceBtwInputFields),

              /// -- Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: UTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                UValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: UTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Email
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            expands: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: UTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            expands: false,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: UTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: UTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwSections),

          /// -- Terms and Conditions
          const UTermsAndConditionCheckbox(),
          const SizedBox(height: USizes.spaceBtwSections),

          /// -- Create account button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(UTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
