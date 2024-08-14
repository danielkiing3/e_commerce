import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    required this.imageString,
    this.width = 56,
    this.height = 56,
    this.padding = USizes.sm,
    this.fit = BoxFit.cover,
    this.overlayColor,
    this.backgroundColor,
    this.isNetworkImage = false,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final String imageString;
  final Color? overlayColor, backgroundColor;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (UHelperFunctions.isDarkMode(context)
                ? UColors.black
                : UColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: isNetworkImage
            ? NetworkImage(imageString)
            : AssetImage(imageString) as ImageProvider,
        fit: fit,
        color: overlayColor,
      ),
    );
  }
}
