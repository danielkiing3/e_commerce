import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UTermsAndConditionCheckbox extends StatelessWidget {
  const UTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(width: USizes.spaceBtwItems),
        Text.rich(
          // -- Or use RichText
          TextSpan(
            children: [
              const TextSpan(text: '${UTexts.iAgreeTo} '),
              TextSpan(
                text: UTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDark ? UColors.white : UColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDark ? UColors.white : UColors.primary,
                    ),
              ),
              const TextSpan(text: ' ${UTexts.and} '),
              TextSpan(
                text: UTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDark ? UColors.white : UColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDark ? UColors.white : UColors.primary,
                    ),
              ),
            ],
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
