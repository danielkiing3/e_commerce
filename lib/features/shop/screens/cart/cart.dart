import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: ListView.separated(
            itemBuilder: (_, index) => const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UCartItem(),
                    SizedBox(height: USizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            /// Extra Space
                            SizedBox(width: 70),

                            /// Add Remove Button
                            UProductQuantityWithAddRemoveButton(),
                          ],
                        ),

                        /// Product Total Price
                        UProductPriceText(price: '256')
                      ],
                    ),
                  ],
                ),
            separatorBuilder: (_, __) =>
                const SizedBox(height: USizes.spaceBtwSections),
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          right: USizes.defaultSpace,
          left: USizes.defaultSpace,
          bottom: USizes.defaultSpace * 1.5,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout \$2000'),
        ),
      ),
    );
  }
}
