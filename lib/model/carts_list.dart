import 'package:flutter/material.dart';

class CartList{
  int id;
  int userid;
  String date;
  var products;
  CartList({
    required this.id,
    required this.userid,
    required this.products,
    required this.date
  });

//  factory CartList.fromJson(Map<String, dynamic> json) {
//   return CartList(
//     id: json['id'],
//      userid: json['userId'],
//       products: json['products'],
//        date: json['date']);
//  }


}