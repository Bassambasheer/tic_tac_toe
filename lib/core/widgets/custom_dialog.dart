import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,   
      required this.content,
      required this.callback,
      required this.actionText})
      : super(key: key);
  final content;
  final VoidCallback callback;
  final actionText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(content),
      actions: [
        TextButton(onPressed: callback ,child: Text(actionText))
      ],
    );
  }
}
