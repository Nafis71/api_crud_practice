import 'package:api_crud_practice/controllers/data_controller.dart';
import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/utils/text_constants.dart';
import 'package:api_crud_practice/views/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProductScreen extends StatefulWidget {
  final DataController dataController;
  const AddProductScreen({super.key, required this.dataController});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _productCodeController;
  late TextEditingController _nameController;
  late TextEditingController _unitPriceController;
  late TextEditingController _quantityController;
  late TextEditingController _imageController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _productCodeController = TextEditingController();
    _nameController = TextEditingController();
    _unitPriceController = TextEditingController();
    _quantityController = TextEditingController();
    _imageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            margin: const EdgeInsets.all(10.00),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller: _productCodeController,
                            labelText: productCodeLabelText,
                            hintText: productCodeHintText,
                            regularExpression: alphabetsAndDigitsRegEx,
                            isEnabled: true,
                            errorText: productCodeErrorText,
                            textInputType: TextInputType.text,
                          ),
                          const Gap(20),
                          AppTextFormField(
                            controller: _nameController,
                            labelText: productNameLabelText,
                            hintText: productNameHintText,
                            regularExpression: alphabetsAndDigitsWithSpaceRegEx,
                            isEnabled: true,
                            errorText: productNameErrorText,
                            textInputType: TextInputType.text,
                          ),
                          const Gap(20),
                          AppTextFormField(
                            controller: _unitPriceController,
                            labelText: productUnitPriceLabelText,
                            hintText: productUnitPriceHintText,
                            regularExpression: digitsRegEx,
                            isEnabled: true,
                            errorText: productUnitPriceErrorText,
                            textInputType: TextInputType.number,
                          ),
                          const Gap(20),
                          AppTextFormField(
                            controller: _quantityController,
                            labelText: productQuantityLabelText,
                            hintText: productQuantityHintText,
                            regularExpression: digitsRegEx,
                            isEnabled: true,
                            errorText: productQuantityErrorText,
                            textInputType: TextInputType.number,
                          ),
                          const Gap(20),
                          AppTextFormField(
                            controller: _imageController,
                            labelText: productImageLabelText,
                            hintText: productImageHintText,
                            regularExpression: imageUrlRegEx,
                            isEnabled: true,
                            errorText: productImageErrorText,
                            textInputType: TextInputType.text,
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: (orientation == Orientation.portrait) ? MediaQuery
                      .of(context)
                      .size
                      .height * 0.075 : MediaQuery
                      .of(context)
                      .size
                      .height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(0.00),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ProductModel product = ProductModel(sId: "0",
                            productName: _nameController.text,
                            productCode: _productCodeController.text,
                            img: _imageController.text,
                            unitPrice: _unitPriceController.text,
                            qty: _quantityController.text,
                            totalPrice: "0");
                        widget.dataController.addProduct(_formKey, product);
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save Data"),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _productCodeController.dispose();
    _nameController.dispose();
    _unitPriceController.dispose();
    _quantityController.dispose();
    _imageController.dispose();
    super.dispose();
  }
}
