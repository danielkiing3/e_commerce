import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- App Bar
      appBar: const UAppBar(
        showBackArrow: true,
        title: Text('Reviews & Ratings'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people use the same type of device that you use.'),
              const SizedBox(height: USizes.spaceBtwItems),

              /// -- Overral Product Rarting
              const UOverallProductRating(),
              const URatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: USizes.spaceBtwItems),

              /// User Reviews List
              const UUserReviewCard(),
              const UUserReviewCard(),
              const UUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
