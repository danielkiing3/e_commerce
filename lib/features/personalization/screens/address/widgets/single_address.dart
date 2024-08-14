import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return URoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(USizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? UColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? UColors.darkerGrey
              : UColors.grey,
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress
                  ? isDark
                      ? UColors.light
                      : UColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gideon Olayinka',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: USizes.sm / 2),
              const Text('+234 9155975747',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: USizes.sm / 2),
              const Text(
                '58 Community Road, Pako Area, Akoka, Lagos, Nigeria',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
