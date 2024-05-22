
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldDecoration{
  static InputDecorationTheme getTextFieldDecoration() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(15.00),
    isDense: true,
    constraints: BoxConstraints.loose(const Size(500, 320)),
    enabledBorder: getDefaultBorder(color: appPrimaryColor,width: 1),
    focusedBorder: getDefaultBorder(color: appPrimaryColor),
    errorBorder: getDefaultBorder(color: Colors.red),
    focusedErrorBorder: getDefaultBorder(color: Colors.red),
    disabledBorder: getDefaultBorder()
  );

  static OutlineInputBorder getDefaultBorder({Color color = Colors.grey, double width = 2}) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.00),
    gapPadding: 5,
    borderSide:  BorderSide(
      color: color,
      width: width,
    ),
  );
}