import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:flutter/material.dart';

class DataController{
  ApiService apiService;

  DataController(this.apiService);
  
  Future<List<ProductModel>> getProductData() async{
    List<ProductModel> productModel = <ProductModel>[];
    try{
      List<dynamic> jsonData = await apiService.fetchData("ReadProduct");
      for(Map<String,dynamic> json in jsonData){
        productModel.add(ProductModel.fromJson(json));
      }
      return productModel;
    } catch(e){
      log(e.toString());
      return [];
    }
  }

  Future<bool> addProduct(GlobalKey<FormState> formKey, ProductModel product) async{
    product.totalPrice = ((double.tryParse(product.qty) ?? 0.0) * (double.tryParse(product.unitPrice)?? 0.0)).toInt().toString();
    if(formKey.currentState!.validate()){
      try{
        return await apiService.insertData("CreateProduct", product);
      }catch(e){
        log(e.toString());
        return false;
      }
    }
    else{
      return false;
    }
  }

  List<ProductModel> removeProductData(List<ProductModel> productList, int index){
    List<ProductModel> modifiedList = List.from(productList);
    modifiedList.removeAt(index);
    return modifiedList;
  }
}