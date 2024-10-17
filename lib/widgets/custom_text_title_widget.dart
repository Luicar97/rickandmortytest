import 'package:flutter/material.dart';

class CustomTextTitleWidget extends StatelessWidget {
  final String title;
  const CustomTextTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
