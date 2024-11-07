import 'package:flutter/material.dart';

class CreateBox extends StatelessWidget {
  double height;
  double width;

  double? margin;
  double? padding;

  Color? color;
  IconData? icon;
  String? texto = '';

  CreateBox({
    super.key,
    required this.width,
    required this.height,
    this.margin = 0,
    this.padding = 0,
    this.color,
    this.icon,
    this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0.0),
      padding: EdgeInsets.all(padding ?? 0.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1),
      ),
      width: width,
      alignment: Alignment.center,
      height: height,
      child: icon != null ? Icon(icon) : Text(texto ?? ''),
    );
  }
}
