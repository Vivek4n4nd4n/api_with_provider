import 'package:flutter/material.dart';

class UserList {
  var address;

  int id;
  String email;
  String username;
  String password;
  String phone;
  var name;

  UserList({
     required this.name,
    required this.id,
     required this.phone,
     required this.address,
  
     required this.email,
    
     required this.password,
     required this.username,
    

  });
  // factory UserList.fromJson(Map<String, dynamic> json) {
  //   return UserList(
  //     name: json['name'],
  //     id: json['id'],
  //     phone: json['phone'],
  //     address: json['address'],

  //     email: json['email'],
      
  //     password: json['password'],
  //     username: json['username'],
      
  //   );
  // }
}
