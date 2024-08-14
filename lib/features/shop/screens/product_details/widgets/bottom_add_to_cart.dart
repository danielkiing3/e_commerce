import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: USizes.defaultSpace, vertical: USizes.defaultSpace),
      decoration: BoxDecoration(
        color: isDark ? UColors.darkerGrey : UColors.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(USizes.cardRadiusLg),
          topLeft: Radius.circular(USizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const UCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: UColors.darkGrey,
                color: UColors.white,
              ),
              const SizedBox(width: USizes.spaceBtwItems),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: USizes.spaceBtwItems),
              const UCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: UColors.black,
                color: UColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: UColors.black,
                side: const BorderSide(color: UColors.black)),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
