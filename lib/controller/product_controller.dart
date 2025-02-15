import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_task/model/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends ChangeNotifier {
  ProductModel? productData;
  static String url = "https://dummyjson.com/products";
  Future<ProductModel?> productList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.body);
    } else {
      print("Value");
    }
    return null;
  }

  allProductData() async {
    productData = await productList();
    notifyListeners();
  }
}
