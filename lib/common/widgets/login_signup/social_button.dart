import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// -- Google button
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: Image.asset(
              UImages.google,
              width: USizes.iconMd,
              height: USizes.iconMd,
            ),
            onPressed: () {},
          ),
        ),

        /// -- Space between items
        const SizedBox(width: USizes.spaceBtwItems),

        /// -- Facebook button
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: Image.asset(
              UImages.facebook,
              width: USizes.iconMd,
              height: USizes.iconMd,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
