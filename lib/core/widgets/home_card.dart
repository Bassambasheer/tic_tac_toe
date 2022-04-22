import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/widgets/text_widget.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.size,
    required this.text,required this.ontap,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          width: size.width / 1.5,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: text,
                size: 20,
                color: gradientBrightPeach,
                weight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
