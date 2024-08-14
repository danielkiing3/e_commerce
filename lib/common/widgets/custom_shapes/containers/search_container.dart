import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class USearchContainer extends StatelessWidget {
  const USearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Padding(
      padding: padding,
      child: Container(
        width: UDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(USizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? isDark
                  ? UColors.dark
                  : UColors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(USizes.cardRadiusLg),
          border: showBorder ? Border.all(color: UColors.grey) : null,
        ),
        child: Row(
          children: [
            /// -- Search Icon
            Icon(icon, color: UColors.darkerGrey),
            const SizedBox(width: USizes.spaceBtwItems),

            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: UColors.darkGrey),
            )
          ],
        ),
      ),
    );
  }
}
