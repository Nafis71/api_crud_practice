import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../themes/text_theme.dart';
import '../../utils/text_constants.dart';
import '../widgets/app_text_form_field.dart';

class FormLayout extends StatelessWidget {
  final TextEditingController productCodeController;
  final TextEditingController nameController;
  final TextEditingController unitPriceController;
  final TextEditingController quantityController;
  final TextEditingController imageController;
  final GlobalKey<FormState> formKey;

  const FormLayout(
      {super.key,
      required this.formKey,
      required this.productCodeController,
      required this.nameController,
      required this.unitPriceController,
      required this.quantityController,
      required this.imageController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Gap(15),
          Text(
            "Enter Product Information",
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
            isEnabled: true,
            errorText: productCodeErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
          AppTextFormField(
            controller: nameController,
            labelText: productNameLabelText,
            hintText: productNameHintText,
            regularExpression: alphabetsAndDigitsWithSpaceRegEx,
            isEnabled: true,
            errorText: productNameErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
          AppTextFormField(
            controller: unitPriceController,
            labelText: productUnitPriceLabelText,
            hintText: productUnitPriceHintText,
            regularExpression: digitsRegEx,
            isEnabled: true,
            errorText: productUnitPriceErrorText,
            textInputType: TextInputType.number,
          ),
          const Gap(20),
          AppTextFormField(
            controller: quantityController,
            labelText: productQuantityLabelText,
            hintText: productQuantityHintText,
            regularExpression: digitsRegEx,
            isEnabled: true,
            errorText: productQuantityErrorText,
            textInputType: TextInputType.number,
          ),
          const Gap(20),
          AppTextFormField(
            controller: imageController,
            labelText: productImageLabelText,
            hintText: productImageHintText,
            isEnabled: true,
            errorText: productImageErrorText,
            textInputType: TextInputType.text,
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
