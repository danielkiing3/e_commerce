import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class UUserProfileTile extends StatelessWidget {
  const UUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UCircularImage(
        imageString: UImages.user,
        width: 50,
        height: 0,
        padding: 0,
      ),
      title: Text(
        'Enwelum Promise',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: UColors.white),
      ),
      subtitle: Text(
        'promisetheenergy@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: UColors.white,
        ),
      ),
    );
  }
}
