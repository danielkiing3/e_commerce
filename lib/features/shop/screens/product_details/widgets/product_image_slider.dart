import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UProductImageSlider extends StatelessWidget {
  const UProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return UCurvedPathWidget(
      child: Container(
        color: isDark ? UColors.darkerGrey : UColors.light,
        child: Stack(
          children: [
            /// -- Main Large Image
            const SizedBox(
              height: 400,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(USizes.productImageRadius * 2),
                  child: Image(
                    image: AssetImage(UImages.productImage1),
                  ),
                ),
              ),
            ),

            /// -- Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: USizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemBuilder: (_, index) => URoundedImage(
                    imageUrl: UImages.productImage10,
                    backgroundColor: isDark ? UColors.dark : UColors.light,
                    padding: const EdgeInsets.all(USizes.sm),
                    border: Border.all(color: UColors.primary),
                    width: 80,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: USizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),

            /// -- App Bar Icon
            const UAppBar(
              showBackArrow: true,
              actions: [
                UCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
