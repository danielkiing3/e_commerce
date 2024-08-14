import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(title: Text('Sport Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// -- Banner
              const URoundedImage(
                  imageUrl: UImages.promoBanner1, width: double.infinity),
              const SizedBox(height: USizes.spaceBtwSections),

              /// -- Sub-Categories
              Column(
                children: [
                  /// -- Heading
                  USectionHeading(
                    title: 'Sport Shirts',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: USizes.spaceBtwSections),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: USizes.spaceBtwItems),
                      itemBuilder: (_, index) => const UProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
