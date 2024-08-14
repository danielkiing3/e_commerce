import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_with_verified_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.md),
        backgroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: UCircularImage(
                isNetworkImage: false,
                imageString: UImages.appleLogo,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? UColors.white : UColors.black,
              ),
            ),
            const SizedBox(width: USizes.spaceBtwItems / 2),

            /// - Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UBrandTitleWithVerifiedIcon(
                      title: 'Apple', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
