import 'package:flutter/material.dart';
class ContainerBar extends StatelessWidget {
  const ContainerBar({Key? key, required this.size, required this.child})
      : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: Colors.blueGrey[800], boxShadow:  const [
        BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(1, 1))
      ]),
      width: size.width,
      height: 90,
      child: child,
    );
  }
}
