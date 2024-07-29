import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = UColors.white,
    this.backgroundColor = UColors.white,
    required this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// -- Circular Icon
          Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.only(right: USizes.spaceBtwItems),
            padding: const EdgeInsets.all(USizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color:
                  backgroundColor ?? (isDark ? UColors.black : UColors.white),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              color: (isDark ? UColors.light : UColors.dark),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwItems / 2),

          /// -- Text
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: textColor,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
