import 'package:flutter/material.dart';

class CustomTextTitleWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomTextTitleWidget({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
