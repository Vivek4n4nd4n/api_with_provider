import 'package:api_models/model/carts_list.dart';
import 'package:api_models/model/userlist.dart';
import 'package:api_models/provider/service/cart_services.dart';
import 'package:api_models/provider/service/user_services.dart';
import 'package:flutter/material.dart';

class UserListProvider extends ChangeNotifier {
  final _service = UserListServices();
  bool isLoading = false;

  List<UserList> _userList = [];
  List<UserList> get userList => _userList;

  Future<void> getAllCurtData() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _userList = response;
    isLoading = false;
    notifyListeners();
  }
}
