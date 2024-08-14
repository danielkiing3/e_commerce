import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            const UPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  UHomeAppBar(),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// -- SearchBar
                  USearchContainer(text: 'Search in Store'),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: USizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Categories Heading
                        USectionHeading(title: 'Popular Categories'),
                        SizedBox(height: USizes.spaceBtwItems),

                        /// -- Categories
                        UHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const UPromoSlider(
                    banners: [
                      UImages.promoBanner1,
                      UImages.promoBanner2,
                      UImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: USizes.spaceBtwSections),

                  /// -- Header
                  USectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(height: USizes.spaceBtwItems),

                  /// -- Popular Product
                  UGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return const UProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
