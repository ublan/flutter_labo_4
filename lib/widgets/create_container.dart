import 'package:flutter/material.dart';

class CreateContainer extends StatelessWidget {
  double height;
  double width;

  EdgeInsets? margin;
  EdgeInsets? padding;
  Color? cajaColor;
  Widget? child;

  CreateContainer(
      {super.key,
      required this.width,
      required this.height,
      this.margin,
      this.padding,
      this.cajaColor,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: cajaColor, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
