import 'package:flutter/material.dart';
import 'package:wedad_api/api_client.dart';
import 'package:wedad_api/responses/get_all_products_response.dart';

class MainProvider extends ChangeNotifier {
  MainProvider() {
    getAllCategories();
  }

  List<ProductResponse> products = [];
  List<String> categories = [];
  String selectedCategory = '';
  getAllCategories() async {
    categories = await ApiClient.apiClient.getAllCategories();
    this.selectedCategory = categories.first;
    getCategoryProducts(categories.first);
  }

  getCategoryProducts(String category) async {
    products.clear();
    this.selectedCategory = category;
    notifyListeners();
    products = await ApiClient.apiClient.getCategoryProducts(category);
    notifyListeners();
  }

  // getAllProducts() async {
  //   products = await ApiClient.apiClient.getAllProducts();
  //   notifyListeners();
  // }
}
