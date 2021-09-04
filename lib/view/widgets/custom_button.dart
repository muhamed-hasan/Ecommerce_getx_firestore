import 'package:e_commerce_getx/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final Color color;
  final Function()? onTap;

  const CustomButton(
      {Key? key, this.color = primaryColor, this.onTap, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        hoverColor: Colors.transparent,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: color,
        elevation: 0,
        padding: EdgeInsets.all(22),
        child: child);
  }
}
