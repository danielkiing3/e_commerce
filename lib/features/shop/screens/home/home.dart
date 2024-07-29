// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/session_heading.dart';

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
                        /// -- Heading
                        USessionHeading(title: 'Popular Categories'),
                        SizedBox(height: USizes.spaceBtwItems),

                        /// -- Categories
                        UHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  UPromoSlider(
                    banners: [
                      UImages.promoBanner1,
                      UImages.promoBanner2,
                      UImages.promoBanner3,
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// -- Popular Product
                  UGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return UProductCardVertical();
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
