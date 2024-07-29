import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return UVerticalImageText(
            image: UImages.shoeIcon,
            title: 'Shoes',
            onTap: () {},
          );
        },
      ),
    );
  }
}
