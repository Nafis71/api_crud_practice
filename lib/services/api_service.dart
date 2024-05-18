import 'dart:convert';

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
      throw Exception("Failed to load data");
    }
  }
}
