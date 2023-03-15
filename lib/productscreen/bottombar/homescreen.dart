import 'dart:convert';

import 'package:api_models/home/classes/select_items.dart';
import 'package:api_models/home/classes/showlistpage.dart';
import 'package:api_models/model/home_productlist.dart';
import 'package:api_models/model/userlist.dart';
import 'package:api_models/login/login_screen.dart';
import 'package:api_models/model/productlist.dart';
import 'package:api_models/provider/homelist/homeprovider.dart';
import 'package:api_models/provider/productlist/product_list_provider.dart';
import 'package:api_models/provider/service/home_product_list_services.dart';
import 'package:api_models/user_data/widgets/category.dart';
import 'package:api_models/user_data/widgets/list_of_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  String category;
  String description;
  String image;
  // var price;
  int id;

  HomeScreen({
    required this.category,
    required this.description,
    required this.image,
    required this.id,
    //  required this.price,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int items = 0;
  var url = 'products';

  Future fetchAlbum() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );

    if (response.statusCode == 200) {
      print("test ${response.body}");

      final List result = const JsonDecoder().convert(response.body);

      return result;
      //.map((e) => HomeProductList.fromJson(e)).toList();
    } else {
      throw Exception('Data not loaded');
    }
  }
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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeCategoryListProvider>(context, listen: false)
          .getAllProductListData(url);
      Provider.of<HomeProductListProvider>(context, listen: false)
          .getAllProductListData(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  url = 'products';
                });
                Provider.of<HomeProductListProvider>(context, listen: false)
                    .getAllProductListData(url);
              },
              icon: Icon(Icons.refresh))
        ],
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen(
                          title: 'Login here',
                        )));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 237, 240, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Consumer<HomeCategoryListProvider>(
              builder: (context, value, child) {
                final data = value.homeCategoryList;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length, // value.homeCategoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              
                                setState(() {
                                  url =
                                      'products/category/${data[index].category}';
                                });
                                Provider.of<HomeProductListProvider>(context,
                                        listen: false)
                                    .getAllProductListData(url);
                                
                                print("hii${url}");
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Card(
                                color: Colors.lightGreen,
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data[index].category),
                                )),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: Consumer<HomeProductListProvider>(
                builder: (context, value, child) {
                  final data = value.homeproductList;
                  return ListView.builder(
                      itemCount: value.homeproductList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            // builder: (context)=>ShowListPage(items: value.homeproductList[index],)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(data[index].category),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 120,
                                          width: 150,
                                          child: Image.network(
                                            data[index].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            'id : ${data[index].id.toString()}'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            width: 90,
                                            height: 90,
                                            child: Text(
                                                'Title :\n ${data[index].title}')),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "price : \$ ${data[index].price.toString()}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                },
              ),
            )

            // Container(
            //   color: Color.fromARGB(255, 219, 223, 225),
            //   child: FutureBuilder(
            //       future: fetchAlbumA(),
            //       builder: (context, snapshot) {
            //         return GridView.builder(
            //           gridDelegate:
            //               const SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 2, crossAxisSpacing: 2),
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: GestureDetector(
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => ShowListPage(
            //                                 items: snapshot.data![index],
            //                               )));
            //                 },
            //                 child: Container(
            //                   height: 350,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20),
            //                     color: const Color.fromARGB(255, 197, 211, 0),
            //                   ),
            //                   child: Expanded(
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(6.0),
            //                           child: Row(
            //                             children: [
            //                               Text(
            //                                 snapshot.data![index].id.toString(),
            //                                 style: const TextStyle(
            //                                     color: Colors.white),
            //                               ),
            //                               const SizedBox(
            //                                 width: 10,
            //                               ),
            //                               Text(
            //                                 snapshot.data![index].category,
            //                                 style: const TextStyle(
            //                                     color: Colors.white),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.all(2.0),
            //                           child: Container(
            //                             height: 120,
            //                             decoration: BoxDecoration(
            //                                 borderRadius:
            //                                     BorderRadius.circular(10)),
            //                             margin: const EdgeInsets.all(10),
            //                             child: Image.network(
            //                               snapshot.data![index].image,
            //                               fit: BoxFit.cover,
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
