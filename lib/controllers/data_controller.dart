import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:flutter/material.dart';

class DataController{
  ApiService apiService;

  DataController(this.apiService);
  
  Future<List<ProductModel>> getProductData()async{
    List<ProductModel> productModel = <ProductModel>[];
    try{
      List<dynamic> jsonData = await apiService.fetchData("ReadProduct");
      for(Map<String,dynamic> json in jsonData){
        productModel.add(ProductModel.fromJson(json));
      }
      return productModel;
    } catch(e){
      debugPrint(e.toString());
      return [];
    }
  }
}