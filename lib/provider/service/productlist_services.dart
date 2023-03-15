import 'dart:convert';

import 'package:api_models/model/carts_list.dart';
import 'package:api_models/model/productlist.dart';
import 'package:http/http.dart' as http;

class ProductListServices {
  Future<List<ProductList>> getAll() async {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return ProductList(
            id: e['id'],
            title: e['title'],
           description : e['description'],
            category: e['category'],
            price:  e['price'],
            rating: e['rating'],
             image: e['image']
            
            );
      }).toList();
      return todos;
    }
    return [];
    //throw 'some thing went wrong';
  }
}

