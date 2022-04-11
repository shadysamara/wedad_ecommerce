import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wedad_api/responses/get_all_products_response.dart';

class ApiClient {
  Dio dio = Dio();
  static ApiClient apiClient = ApiClient();
  Future<List<ProductResponse>> getAllProducts() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List dataList = response.data;
    List<ProductResponse> products = dataList.map((element) {
      return ProductResponse.fromJson(element);
    }).toList();
    return products;
  }
   Future<List<String>> getAllCategories() async {
    Response response = await dio.get('https://fakestoreapi.com/products/categories');
    List dataList = response.data;
    List<String> categories = dataList.map((element) {
      return element.toString();
    }).toList();
    return categories;
  }
   Future<List<ProductResponse>> getCategoryProducts(String category) async {
    Response response = await dio.get('https://fakestoreapi.com/products/category/$category');
    List dataList = response.data;
    List<ProductResponse> products = dataList.map((element) {
      return ProductResponse.fromJson(element);
    }).toList();
    return products;
  }
}
