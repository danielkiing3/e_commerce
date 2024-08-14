import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);

    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwItems),
      itemBuilder: (_, index) => URoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(USizes.md),
        backgroundColor: isDark ? UColors.dark : UColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// -- Row 1
            Row(
              children: [
                /// -- 1. Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: USizes.spaceBtwItems / 2),

                /// -- 2. Status amd Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: UColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text('08 Dec, 2004',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// -- 3. Icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: USizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(height: USizes.spaceBtwItems),

            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// -- 1. Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: USizes.spaceBtwItems / 2),

                      /// -- 2. Status amd Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Order',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text('[#24646]',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// -- 1. Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: USizes.spaceBtwItems / 2),

                      /// -- 2. Status amd Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium),
                          Text('11 Aug, 2024',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
