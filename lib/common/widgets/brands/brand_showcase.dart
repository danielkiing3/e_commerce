import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class UBrandShowcase extends StatelessWidget {
  const UBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(USizes.md),
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        children: [
          /// -- Brand with Product Counts
          const UBrandCard(showBorder: false),
          const SizedBox(height: USizes.spaceBtwItems),

          /// -- Brand top three images
          Row(
            children: images
                .map((image) => brandTabProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTabProductImageWidget(String image, context) {
  return Expanded(
    child: URoundedContainer(
      height: 100,
      backgroundColor: UHelperFunctions.isDarkMode(context)
          ? UColors.darkerGrey
          : UColors.light,
      margin: const EdgeInsets.only(right: USizes.sm),
      padding: const EdgeInsets.all(USizes.md),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
      ),
    ),
  );
}
