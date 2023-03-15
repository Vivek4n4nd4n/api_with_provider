import 'dart:convert';

import 'package:api_models/model/carts_list.dart';
import 'package:api_models/model/userlist.dart';
import 'package:http/http.dart' as http;

class UserListServices {
  Future<List<UserList>> getAll() async {
    const url = 'https://fakestoreapi.com/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return UserList(
            id: e['id'],
            email: e['email'],
           username : e['username'],
            password: e['password'],
            name: e['name'],
            phone: e['phone'],
            address: e['address']
            
            );
            
      }).toList();
      return todos;
    }
    return [];
    //throw 'some thing went wrong';
  }
}

