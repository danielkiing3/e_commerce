import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UUserReviewCard extends StatelessWidget {
  const UUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(UImages.userProfileImage1)),
                const SizedBox(width: USizes.spaceBtwItems),
                Text('Gideon Olayinka',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems),

        /// Reviews
        Row(
          children: [
            const URatingBarIndicator(rating: 4),
            const SizedBox(width: USizes.spaceBtwItems),
            Text('08 Dec, 2004', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems),

        /// Description
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make payment seamlessly. Well done',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: UColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: UColors.primary),
        ),
        const SizedBox(height: USizes.spaceBtwItems),

        /// Company Review
        URoundedContainer(
          backgroundColor: isDark ? UColors.darkerGrey : UColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(USizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Magic\'s Store',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('01 Jan, 2005',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: USizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make payment seamlessly. Well done',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: UColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: UColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: USizes.spaceBtwSections),
      ],
    );
  }
}
