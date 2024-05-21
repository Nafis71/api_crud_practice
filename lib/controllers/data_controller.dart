import 'dart:async';
import 'dart:developer';
import 'package:api_crud_practice/controllers/data_repository.dart';
import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:flutter/material.dart';

import '../utils/text_constants.dart';

class DataController implements DataRepository {
  ApiService apiService;

  DataController(this.apiService);

  @override
  Future<List<ProductModel>> getProductData() async {
    List<ProductModel> productModel = <ProductModel>[];
    try {
      List<dynamic> jsonData = await apiService.fetchData(readProductEndpoint);
      for (Map<String, dynamic> json in jsonData) {
        productModel.add(ProductModel.fromJson(json));
      }
      return productModel;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<bool> addProduct(ProductModel product) async {
    try {
      return await apiService.insertData(createProductEndpoint, product);
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateProduct(ProductModel product) async {
    try {
      return await apiService.updateData(updateProductEndpoint, product);
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  List<ProductModel> removeProductData(
      List<ProductModel> productList, int index) {
    List<ProductModel> modifiedList = List.from(productList);
    modifiedList.removeAt(index);
    try {
      apiService.deleteData(deleteProductEndpoint, productList[index].sId);
    } catch (e) {
      log(e.toString());
    }

    return modifiedList;
  }

  @override
  ProductModel processInputData({
    String? productId,
    required String productName,
    required String productCode,
    required String productImage,
    required String productUnitPrice,
    required String productQuantity,
  }) {
    int totalPrice = ((double.tryParse(productUnitPrice) ?? 0.0) *
            (double.tryParse(productQuantity) ?? 0.0))
        .toInt();
    ProductModel product = ProductModel(
        sId: productId ?? "0",
        productName: productName,
        productCode: productCode,
        img: productImage,
        unitPrice: productUnitPrice,
        qty: productQuantity,
        totalPrice: totalPrice.toString());
    return product;
  }
}
