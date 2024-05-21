import 'dart:convert';

import 'package:api_crud_practice/models/product_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<dynamic>> fetchData(String endPoint) async {
    final Response response = await http.get(Uri.parse("$baseUrl/$endPoint"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      return decodedData['data'];
    } else {
      throw Exception("Failed to load data : Error ${response.statusCode}");
    }
  }

  Future<bool> insertData(String endPoint, ProductModel product) async {
    final Response response = await http.post(Uri.parse("$baseUrl/$endPoint"),
        body: jsonEncode(product.toJson()),
        headers: {'content-type': 'application/json'});
    if(response.statusCode == 200){
      return true;
    }
    throw Exception("Failed to save data : Error ${response.statusCode}");
  }

  Future<bool> updateData(String endPoint, ProductModel product) async {
    final Response response = await http.post(Uri.parse("$baseUrl/$endPoint/${product.sId}"),
        body: jsonEncode(product.toJson()),
        headers: {'content-type': 'application/json'});
    if(response.statusCode == 200){
      return true;
    }
    throw Exception("Failed to update data : Error ${response.statusCode}");
  }

  Future<bool> deleteData(String endPoint,String productId)async{
    final Response response = await http.get(Uri.parse("$baseUrl/$endPoint/$productId"));
    if(response.statusCode == 200){
      return true;
    }
    throw Exception("Failed to delete data : Error ${response.statusCode}");
  }

}
