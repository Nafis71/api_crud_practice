import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText, errorText;
  final String? regularExpression;
  final bool isEnabled;
  final TextInputType textInputType;

  const AppTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.regularExpression,
      this.isEnabled = true,
      required this.errorText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      validator: (value) {
        if (regularExpression != null &&
            (value!.isEmpty || !RegExp(regularExpression!).hasMatch(value))) {
          return errorText;
        }
        if (value!.isEmpty) {
          return errorText;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
