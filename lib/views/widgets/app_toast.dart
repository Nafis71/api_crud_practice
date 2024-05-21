import 'package:api_crud_practice/themes/text_theme.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ToastificationItem showToast(
    {required String content, required BuildContext context}) {
  return toastification.show(
      context: context,
      title: const Text("Successful"),
      description: Text(content,style: TextThemes.getTextStyle(color: Colors.grey),),
      autoCloseDuration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle_outline,color: Colors.green,),
      alignment: Alignment.topRight,
      foregroundColor: blackColor,
      backgroundColor: whiteColor,
      borderSide: const BorderSide(
        color: whiteColor,
        width: 0
      ),
      primaryColor: appPrimaryColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
            color: blackColor.withOpacity(0.15),
            blurRadius: 20.00,
            spreadRadius: 2.00,
            offset: const Offset(0, 5))
      ],
      showProgressBar: false,
      style: ToastificationStyle.minimal);
}
