// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

class ProductList {
  String title;
  String image;
  String description;
  String category;

  var price;
  int id;
  var rating;

  ProductList(
      {required this.image,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.rating,
      required this.id});

  // factory ProductList.fromJson(Map<String, dynamic> json) {
  //   return ProductList(
  //       image: json['image'],
  //       price: json['price'],
  //       title: json['title'],
  //       description: json['description'],
  //       category: json['category'],
  //       rating: json['rating'],
  //       id: json['id']);
  // }
}
