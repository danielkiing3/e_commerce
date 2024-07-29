import 'package:flutter/material.dart';

class UProductTitleText extends StatelessWidget {
  const UProductTitleText({
    super.key,
    required this.text,
    this.smallSize = false,
    this.maxlines = 2,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final bool smallSize;
  final int maxlines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign,
    );
  }
}
