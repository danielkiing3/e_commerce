import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        URoundedContainer(
          padding: const EdgeInsets.all(USizes.md),
          backgroundColor: isDark ? UColors.darkerGrey : UColors.grey,
          child: Column(
            children: [
              /// TItle, Price and Stock
              ///
              Row(
                children: [
                  const USectionHeading(title: 'Variation'),
                  const SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const UProductTitleText(
                              text: 'Price : ', smallSize: true),

                          /// Sale Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: USizes.spaceBtwItems),

                          /// Actual Price
                          const UProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const UProductTitleText(
                              text: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const UProductTitleText(
                text:
                    'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxlines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: USizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const USectionHeading(title: 'Color'),
            const SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                UChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Blue',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const USectionHeading(title: 'Size'),
            const SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                UChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
