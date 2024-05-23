import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../themes/text_theme.dart';
import '../../utils/text_constants.dart';
import 'app_text_form_field.dart';

class FormLayout extends StatelessWidget {
  final TextEditingController productCodeController;
  final TextEditingController nameController;
  final TextEditingController unitPriceController;
  final TextEditingController quantityController;
  final TextEditingController imageController;
  final String title;
  final GlobalKey<FormState> formKey;

  const FormLayout(
      {super.key,
      required this.formKey,
      required this.productCodeController,
      required this.nameController,
      required this.unitPriceController,
      required this.quantityController,
      required this.imageController, required this.title});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Gap(15),
          Text(
            title,
            style: TextThemes.getTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          AppTextFormField(
            controller: productCodeController,
            labelText: productCodeLabelText,
            hintText: productCodeHintText,
            regularExpression: alphabetsAndDigitsRegEx,
            errorText: productCodeErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
          AppTextFormField(
            controller: nameController,
            labelText: productNameLabelText,
            hintText: productNameHintText,
            regularExpression: alphabetsAndDigitsWithSpaceRegEx,
            errorText: productNameErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
          AppTextFormField(
            controller: unitPriceController,
            labelText: productUnitPriceLabelText,
            hintText: productUnitPriceHintText,
            regularExpression: digitsRegEx,
            errorText: productUnitPriceErrorText,
            textInputType: TextInputType.number,
          ),
          const Gap(20),
          AppTextFormField(
            controller: quantityController,
            labelText: productQuantityLabelText,
            hintText: productQuantityHintText,
            regularExpression: digitsRegEx,
            errorText: productQuantityErrorText,
            textInputType: TextInputType.number,
          ),
          const Gap(20),
          AppTextFormField(
            controller: imageController,
            labelText: productImageLabelText,
            hintText: productImageHintText,
            errorText: productImageErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
