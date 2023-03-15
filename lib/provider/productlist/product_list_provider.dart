import 'package:api_models/model/carts_list.dart';
import 'package:api_models/model/productlist.dart';
import 'package:api_models/provider/service/cart_services.dart';
import 'package:api_models/provider/service/home_product_list_services.dart';
import 'package:api_models/provider/service/productlist_services.dart';
import 'package:flutter/material.dart';

class ProductListProvider extends ChangeNotifier {
  final _service = ProductListServices();
  bool isLoading = false;

  List<ProductList> _productList = [];
  List<ProductList> get productList => _productList;

  Future<void> getAllProductListData() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _productList = response;
    isLoading = false;
    notifyListeners();
  }
}
