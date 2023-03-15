import 'dart:convert';

import 'package:api_models/model/carts_list.dart';
import 'package:http/http.dart' as http;

class CartServices {
  Future<List<CartList>> getAll() async {
    const url = 'https://fakestoreapi.com/carts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return CartList(
            id: e['id'],
            userid: e['userId'],
           products : e['products'],
            date: e['date']);
      }).toList();
      return todos;
    }
    return [];
    //throw 'some thing went wrong';
  }
}

