import 'dart:convert';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String url = 'https://api.restful-api.dev/objects';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
