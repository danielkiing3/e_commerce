import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: USizes.sm, vertical: USizes.xs),
              child: Text('20%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: UColors.black)),
            ),
            const SizedBox(width: USizes.spaceBtwItems),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: USizes.spaceBtwItems),
            const UProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Title
        const UProductTitleText(text: "Green Nike Sport Shoe"),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const UProductTitleText(text: "Status:"),
            const SizedBox(width: USizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            UCircularImage(
              imageString: UImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: isDark ? UColors.white : UColors.black,
            ),
            const UBrandTitleWithVerifiedIcon(
                title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
