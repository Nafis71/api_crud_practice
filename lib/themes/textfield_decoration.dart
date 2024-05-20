
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldDecoration{
  static InputDecorationTheme getTextFieldDecoration() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(15.00),
    isDense: true,
    constraints: BoxConstraints.loose(const Size(500, 320)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.00),
      borderSide: const BorderSide(
        color: appPrimaryLightColor,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.00),
      gapPadding: 5,
      borderSide: const BorderSide(
        color: appPrimaryColor,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.00),
      gapPadding: 5,
      borderSide: const BorderSide(
        color: redColor,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.00),
      gapPadding: 5,
      borderSide: const BorderSide(
        color: redColor,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.00),
      gapPadding: 5,
      borderSide: const BorderSide(
        color: greyColor,
        width: 2,
      ),
    ),
  );
}