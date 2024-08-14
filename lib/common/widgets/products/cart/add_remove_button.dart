import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class UProductQuantityWithAddRemoveButton extends StatelessWidget {
  const UProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// -- Minus Button
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.md,
          color: isDark ? UColors.white : UColors.black,
          backgroundColor: isDark ? UColors.darkerGrey : UColors.light,
        ),
        const SizedBox(width: USizes.spaceBtwItems),

        /// Count
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: USizes.spaceBtwItems),

        /// -- Add Button
        const UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}
