import 'package:api_crud_practice/themes/text_theme.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:api_crud_practice/utils/text_constants.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String title, content;
  final Function onAction;
  const AppAlertDialog({super.key, required this.title, required this.content, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: whiteColor,
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.red,
        size: 35,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            alertDialogCancelButtonText,
            style: TextThemes.getTextStyle(
              color: greyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            onAction();
          },
          child: Text(
            alertDialogDeleteButtonText,
            style: TextThemes.getTextStyle(
              color: alertDialogDeleteButtonColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
