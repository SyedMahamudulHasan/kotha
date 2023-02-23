import 'package:flutter/material.dart';
import 'package:kotha/model/utils/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.08,
          child: Image.asset("assets/logo/logo.png"),
        ),
        const SizedBox(width: 8),
        Text(
          "TTIME",
          style: TextStyle(
            color: KColor.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.06,
          ),
        )
      ],
    );
  }
}
