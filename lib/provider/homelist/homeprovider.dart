

import 'package:api_models/model/home_productlist.dart';
import 'package:api_models/provider/service/home_product_list_services.dart';
import 'package:flutter/cupertino.dart';

import '../../productscreen/bottombar/homescreen.dart';

class HomeProductListProvider extends ChangeNotifier {
  final _service = HomeProductListServices();
  bool isLoading = false;

  List<HomeProductList> _homeproductList = [];
  List<HomeProductList> get homeproductList => _homeproductList;

  Future<void> getAllProductListData(url) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll(url);
    _homeproductList = response.cast<HomeProductList>();
    isLoading = false;
    notifyListeners();
  }
}


class HomeCategoryListProvider extends ChangeNotifier {
  final _service = HomeCategoryListServices();
  bool isLoading = false;

  List<CatagoryList> _homeCategoryList = [];
  List<CatagoryList> get homeCategoryList => _homeCategoryList;

  Future<void> getAllProductListData(url) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _homeCategoryList = response.cast<CatagoryList>();
    isLoading = false;
    notifyListeners();
  }
}

