import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class UCircularIcon extends StatelessWidget {
  const UCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final IconData icon;
  final double? width, height, size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : UHelperFunctions.isDarkMode(context)
                ? UColors.black.withOpacity(0.9)
                : UColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
