import 'package:flutter/material.dart';

import 'package:e_commerce_getx/constants.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final double? height;
  final Color? color;
  final Alignment alignment;

  const CustomText({
    Key? key,
    this.text,
    this.size,
    this.height = 1,
    this.color,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text ?? '',
        // textAlign: TextAlign.center,
        style: TextStyle(
            color: color ?? Colors.black, fontSize: size ?? 16, height: height),
      ),
    );
  }
}
