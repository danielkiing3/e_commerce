// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image Slider
            const UProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: USizes.defaultSpace,
                left: USizes.defaultSpace,
                bottom: USizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Rating & Share
                  const URatingAndShare(),

                  /// -- Price, Title, Stack and Brand
                  UProductMetaData(),

                  /// -- Attributes
                  UProductAttributes(),
                  const SizedBox(height: USizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Checkout')),
                  ),
                  const SizedBox(height: USizes.spaceBtwSections),

                  /// -- Descriptions
                  USectionHeading(title: 'Description'),
                  const SizedBox(height: USizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a product description for Blue Nike Sleeve less vest. There are more things that can be added I am lazy',
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: USizes.spaceBtwItems),

                  /// -- Reviews
                  Divider(),
                  const SizedBox(height: USizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      USectionHeading(title: 'Reviews(199)'),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewScreen()),
                        icon: const Icon(Iconsax.arrow_right_3),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
