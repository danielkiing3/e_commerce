import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const UBrandShowcase(
                images: [
                  UImages.productImage10,
                  UImages.productImage6,
                  UImages.productImage7,
                ],
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              /// -- Products
              USectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              UGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const UProductCardVertical(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
