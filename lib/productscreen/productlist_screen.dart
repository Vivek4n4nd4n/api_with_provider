import 'dart:convert';

import 'package:api_models/productscreen/bottombar/homescreen.dart';
import 'package:api_models/home/classes/showlistpage.dart';
import 'package:api_models/item_view_page.dart';
import 'package:api_models/model/productlist.dart';
import 'package:api_models/provider/productlist/product_list_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Future<List<ProductList>> fetchAlbum() async {
  //   final response =
  //       await http.get(Uri.parse('https://fakestoreapi.com/products'));
  //   if (response.statusCode == 200) {
  //     final List result = const JsonDecoder().convert(response.body);
  //     return result.map((e) => ProductList.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Data not loaded');
  //   }
  // }

  int index = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductListProvider>(context, listen: false).getAllProductListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 207, 212, 220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Product List Screen'),
       actions: [IconButton(onPressed: (){
          
        }, icon: const Icon(Icons.upload))],
      ),
      body:Consumer<ProductListProvider>(builder: (context, value, child) {
        final data = value.productList;
        return GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,
          crossAxisSpacing: 5),
          itemCount: value.productList.length,
          itemBuilder: ((context, index) {
          return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                Text('id : ${data[index].id.toString()}'),
                Spacer(),
                Text(data[index].category),
                
                  ],),
                ),
                Container(height: 100,width: 120,
                  child: Image.network(data[index].image),),
                  SizedBox(height: 20,),
                  Text("price : \$ ${data[index].price.toString()}"),
              ],
            ),
          );
        }));
      },)
      
      //  SizedBox(
      //   child: IndexedStack(
      //     index: index,
      //     children: <Widget>[
      //       FutureBuilder<List<ProductList>>(
      //           future: fetchAlbum(),
      //           builder: (context, snapshot) {
      //             return GridView.builder(
      //                 scrollDirection: Axis.vertical,
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                         mainAxisSpacing: 1,
      //                         crossAxisSpacing: 1,
      //                         crossAxisCount: 2),
      //                 itemCount: snapshot.data!.length,
      //                 itemBuilder: (context, index) {
      //                   if (snapshot.hasData) {
       //                    return ItemView(
      //                       items: snapshot.data![index],
      //                       rating: snapshot.data![index].rating,
      //                      // count:snapshot.data![index].count,
      //                     //  rate: snapshot.data![index].rate,
      //                      price: snapshot.data![index].price,
      //                       title: snapshot.data![index].title.toString(),
      //                       id: snapshot.data![index].id,
      //                       description:
      //                           snapshot.data![index].description.toString(),
      //                       image: snapshot.data![index].image.toString(),
      //                       category:
      //                           snapshot.data![index].category.toString(),
      //                     );
      //                   } else {
      //                     if (snapshot.hasError) {
      //                       return const Center(
      //                         child: CircularProgressIndicator(),
      //                       );
      //                     }
      //                   }
      //                   return null;
      //                 });
      //           }),
      //     ],
      //   ),
      // ),
    );
  }
}
