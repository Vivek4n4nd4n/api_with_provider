import 'package:api_models/model/productlist.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
ProductList items;
   SelectCategory({
    required this.items,
     super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  const Text('widget.items.category'),),
    body: SingleChildScrollView(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: const Color.fromARGB(255, 229, 52, 61),
            child: Text (widget.items.category),
            ),
          ),
        ],
      ),
    ),
    
    
    
    );
  }
}