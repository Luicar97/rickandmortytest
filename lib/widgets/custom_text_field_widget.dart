import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('search'),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
