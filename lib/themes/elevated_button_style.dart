import 'package:api_crud_practice/themes/text_theme.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonStyle {
  static ElevatedButtonThemeData getElevatedButtonStyle() =>
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor,
        backgroundColor: appPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.00)
        ),
        textStyle: TextThemes.getTextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
        elevation: 10,

      ),);
}
