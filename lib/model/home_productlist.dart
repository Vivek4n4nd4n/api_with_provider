// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

class HomeProductList {
  String title;
  String image;
  String description;
  String category;

  var price;
  int id;
  var rating;

  HomeProductList(
      {required this.image,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.rating,
      required this.id});

  // factory HomeProductList.fromJson(Map<String, dynamic> json) {
  //   return HomeProductList(
  //       image: json['image'],
  //       price: json['price'],
  //       title: json['title'],
  //       description: json['description'],
  //       category: json['category'],
  //       rating: json['rating'],
  //       id: json['id']);
  // }
}
class CatagoryList{
  String category ;
  CatagoryList({
    required this.category,
  });
}