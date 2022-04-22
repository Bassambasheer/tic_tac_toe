
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,required this.text,required this.size,required this.color,this.weight, this.type,
  }) : super(key: key);

  final String text;
  final double size;
  final Color color;
  final FontWeight? weight;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: type,
          color: color,
          fontWeight: weight),
    );
  }
}
