import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UCurvedPathWidget(
      child: Container(
        height: 400,
        color: UColors.primary,

        /// -- If [size.isInfinite': is not true.in Stack] error occured -> Readme.
        child: Stack(
          children: [
            /// -- Backgroud Custom Images
            Positioned(
              top: -150,
              right: -250,
              child: UCircularContainer(
                  backgroundColor: UColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: UCircularContainer(
                  backgroundColor: UColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
