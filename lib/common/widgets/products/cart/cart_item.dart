import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        URoundedImage(
          imageUrl: UImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(USizes.md),
          backgroundColor: isDark ? UColors.darkerGrey : UColors.light,
        ),
        const SizedBox(width: USizes.spaceBtwItems),

        /// Title, Price and Size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UBrandTitleWithVerifiedIcon(title: 'Nike'),
              const UProductTitleText(text: 'Black Sport Shoes', maxlines: 1),

              /// Attribute
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'UK 08 ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
