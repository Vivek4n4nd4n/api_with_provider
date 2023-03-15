import 'package:api_models/model/carts_list.dart';
import 'package:api_models/provider/service/cart_services.dart';
import 'package:flutter/material.dart';

class CartListProvider extends ChangeNotifier {
  final _service = CartServices();
  bool isLoading = false;

  List<CartList> _cartList = [];
  List<CartList> get cartList => _cartList;

  Future<void> getAllCurtData() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _cartList = response;
    isLoading = false;
    notifyListeners();
  }
}
