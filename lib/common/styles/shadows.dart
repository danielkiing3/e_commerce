import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UShadowStyle {
  static BoxShadow verticalProductShadow = BoxShadow(
    color: UColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static BoxShadow horizontalProductShadow = BoxShadow(
    color: UColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
