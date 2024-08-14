import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: isDark ? UColors.darkerGrey : UColors.softGrey,
      ),
      child: Row(
        children: [
          /// -- Image Thumbnails
          URoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(USizes.sm),
            backgroundColor: isDark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: URoundedImage(
                    imageUrl: UImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  left: 8,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: USizes.sm,
                      vertical: USizes.xs,
                    ),
                    child: Text(
                      '20%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: UColors.black),
                    ),
                  ),
                ),

                /// -- Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: UCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          /// Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: USizes.md,
                left: USizes.md,
              ),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UProductTitleText(
                          text: 'Green Nike Sleeve Shirt', smallSize: true),
                      SizedBox(height: USizes.spaceBtwItems / 2),
                      UBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                  const Spacer(),

                  /// -- Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: UProductPriceText(price: '20')),
                      Container(
                        decoration: const BoxDecoration(
                          color: UColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(USizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          height: USizes.iconLg * 1.2,
                          width: USizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add, color: UColors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
