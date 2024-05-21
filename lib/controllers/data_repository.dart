import '../models/product_model.dart';
import 'package:flutter/material.dart';

abstract class DataRepository {
  Future<List<ProductModel>> getProductData();

  Future<bool> addProduct(ProductModel product);

  Future<bool> updateProduct(ProductModel product);

  List<ProductModel> removeProductData(
      List<ProductModel> productList, int index);

  ProductModel processInputData({
    required String productName,
    required String productCode,
    required String productImage,
    required String productUnitPrice,
    required String productQuantity,
    String? productId,
  });
}
