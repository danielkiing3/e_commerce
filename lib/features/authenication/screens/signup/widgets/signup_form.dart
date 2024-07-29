import 'package:e_commerce/features/authenication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/authenication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              /// -- First Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: UTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: USizes.spaceBtwInputFields),

              /// -- Second Name
              Expanded(
                child: TextFormField(
                  expands: false,
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
            expands: false,
            decoration: const InputDecoration(
              labelText: UTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: UTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: UTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),

          /// -- Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: UTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(UTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
