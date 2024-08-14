import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return Material(
      color: isDark ? UColors.black : UColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: UColors.primary,
        labelColor: isDark ? UColors.white : UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
