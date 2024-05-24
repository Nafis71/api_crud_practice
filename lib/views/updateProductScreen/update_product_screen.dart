import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../controllers/data_repository.dart';
import '../../models/product_model.dart';
import '../../utils/colors.dart';
import '../../utils/text_constants.dart';
import '../widgets/app_snackbar.dart';
import '../widgets/form_layout.dart';

class UpdateProductScreen extends StatefulWidget {
  final DataRepository dataController;
  final ProductModel product;

  const UpdateProductScreen(
      {super.key, required this.dataController, required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController _productCodeController;
  late TextEditingController _nameController;
  late TextEditingController _unitPriceController;
  late TextEditingController _quantityController;
  late TextEditingController _imageController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSaving = false;

  @override
  void initState() {
    _productCodeController = TextEditingController();
    _nameController = TextEditingController();
    _unitPriceController = TextEditingController();
    _quantityController = TextEditingController();
    _imageController = TextEditingController();
    setControllerValue();
    super.initState();
  }

  void setControllerValue() {
    _productCodeController.text = widget.product.productCode;
    _nameController.text = widget.product.productName;
    _unitPriceController.text = widget.product.unitPrice;
    _quantityController.text = widget.product.qty;
    _imageController.text = widget.product.img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update Product"),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            margin: const EdgeInsets.all(10.00),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
                    child: SingleChildScrollView(
                      child: FormLayout(
                          title: updateProductScreenTitle,
                          formKey: _formKey,
                          productCodeController: _productCodeController,
                          nameController: _nameController,
                          unitPriceController: _unitPriceController,
                          quantityController: _quantityController,
                          imageController: _imageController),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: (orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.height * 0.075
                      : MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(5.00),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() && !isSaving) {
                          isSaving = true;
                          setState(() {});
                          ProductModel product = widget.dataController
                              .processInputData(
                                  productId: widget.product.sId,
                                  productName: _nameController.text,
                                  productCode: _productCodeController.text,
                                  productImage: _imageController.text,
                                  productUnitPrice: _unitPriceController.text,
                                  productQuantity: _quantityController.text);
                          bool status = await widget.dataController
                              .updateProduct(product);
                          if (status) {
                            goBack(updateProductSuccessfulText);
                          } else {
                            isSaving = false;
                            showSnackBar(updateProductFailureText, Colors.red);
                            setState(() {});
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (!isSaving)
                              ? const Icon(Icons.edit)
                              : const CircularProgressIndicator(
                                  color: whiteColor,
                                ),
                          const Gap(15),
                          const Text("Update Product")
                        ],
                      ),
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

  void goBack(String message) {
    Navigator.pop(context, message);
  }

  void showSnackBar(String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(appSnackbar(title, color));
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
