import 'dart:convert';

import 'package:api_models/model/carts_list.dart';
import 'package:api_models/model/home_productlist.dart';
import 'package:api_models/model/productlist.dart';
import 'package:http/http.dart' as http;

class HomeProductListServices {
  Future<List<HomeProductList>> getAll(url) async {
    
    final uri = Uri.parse('https://fakestoreapi.com/$url');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return HomeProductList(
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

class HomeCategoryListServices {
  Future<List<CatagoryList>> getAll() async {
                print("JSoon ");

    final uri = Uri.parse('https://fakestoreapi.com/products/categories');

    final response = await http.get(uri);
    print("test resp ${response.body}");
    if (response.statusCode == 200) {

      final json = jsonDecode(response.body) as List;
      print("JSoon $json");
      final todos = json.map((e) {
print("test $e");
        return CatagoryList(
           
           category: e
            );
      }).toList();
      return todos;
    }
    return [];
    //throw 'some thing went wrong';
  }
}

