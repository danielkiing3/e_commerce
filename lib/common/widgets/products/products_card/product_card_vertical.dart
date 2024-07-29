// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/common/styles/shadows.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [UShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: isDark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          children: [
            /// -- Image Thumbnail
            URoundedContainer(
              height: 180,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: isDark ? UColors.dark : UColors.white,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  URoundedImage(
                    imageUrl: UImages.productImage1,
                    applyImageRadius: true,
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
                  Positioned(
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
            const SizedBox(height: USizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(
                      text: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: USizes.spaceBtwItems / 2),

                  /// -- Brand Detaisl
                  Row(
                    children: [
                      /// -- Brand Name
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: USizes.xs),

                      /// -- Verify Check
                      Icon(
                        Iconsax.verify5,
                        color: UColors.primary,
                        size: USizes.iconXs,
                      ),
                    ],
                  ),

                  // Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// -- Price
                      UProductPriceText(
                        price: '35.0',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: UColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(USizes.productImageRadius),
                          ),
                        ),
                        child: SizedBox(
                          height: USizes.iconLg * 1.2,
                          width: USizes.iconLg * 1.2,
                          child: Center(
                              child: const Icon(Iconsax.add,
                                  color: UColors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
