import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class URatingProgressIndicator extends StatelessWidget {
  const URatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            // width: UDeviceUtils.getScreenWidth() * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: UColors.grey,
              valueColor: const AlwaysStoppedAnimation(UColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
