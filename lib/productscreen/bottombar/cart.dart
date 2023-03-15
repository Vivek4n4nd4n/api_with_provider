import 'dart:convert';

import 'package:api_models/model/carts_list.dart';
import 'package:api_models/provider/cart/cart_provider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserCart extends StatefulWidget {
  CartList items;
  UserCart({required this.items, super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  var url = 'carts';
  // Future<List<CartList>> fetchAlbum() async {
  //   final response = await http.get(Uri.parse('https://fakestoreapi.com/$url'));
  //   if (response.statusCode == 200) {
  //     final List result = const JsonDecoder().convert(response.body);
  //     return result.map((e) => CartList.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Data not loaded');
  //   }
  // }

  int index = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CartListProvider>(context, listen: false).getAllCurtData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('cart.dart'),
      ),

      body: Consumer<CartListProvider>(
        builder: (context, value, child) {
          final data = value.cartList;
          final datas = data[index];
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: value.cartList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        color: Color.fromARGB(255, 204, 211, 195),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Id : ${data[index].id.toString()}'),
                                   const SizedBox(
                                width: 20,
                              ),
                                                     
                                   Text('user id : ${data[index].userid.toString()}'),
                                ],
                              ),
                            ),
                           
                               SizedBox(height: 10,),
                            Text('Date: ${data[index].date}'),
                               SizedBox(height: 10,),
                            Container(
                              color: Color.fromARGB(255, 204, 211, 195),
                            //  height: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data[index].products.length,
                                  itemBuilder: (context, index) {
                                    return Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text("product id : ${datas.products[index]['productId'].toString()}"),
                                        SizedBox(height: 10,),
                                        Text("quantity : ${datas.products[index]['quantity'].toString()}"),
                                        SizedBox(height: 10,),
                                      ],
                                    );
                                  }),
                            ),
                          ]),
                        )));
              });
        },
      ),
      //   body: SingleChildScrollView(
      //     child: Container(color: Color.fromARGB(255, 240, 244, 246),
      // height: 700,
      //       child: FutureBuilder<List<CartList>>(
      //         future: fetchAlbum(),
      //         builder: (context, snapshot) {
      //           return ListView.builder(
      //             scrollDirection: Axis.vertical,
      //               itemCount: snapshot.data!.length,
      //               itemBuilder: (context, index) {
      //                 if (snapshot.hasData) {
      //                   return Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Container(color: Colors.lightGreen,
      //                       child: CartView(items: snapshot.data![index],)),
      //                   );

      //                 } else {
      //                   if (snapshot.hasError) {
      //                     return const Center(
      //                       child: CircularProgressIndicator(),
      //                     );
      //                   }
      //                 }
      //                 return null;

      //               });
      //         },
      //       ),
      //     ),
      //   ),
    );
  }
}


// ignore: non_constant_identifier_names
// class CartView extends StatefulWidget {
  
//   var items;
//   CartView({
//     required this.items,
//     super.key});

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> {
//   var index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//          const SizedBox(height: 20,),
//         Text('Id : ${widget.items.id.toString()}'),
//          const SizedBox(height: 20,),
//           Text('User Id : ${widget.items.userid.toString()}'),
//            const SizedBox(height: 20,),
//           Text('Date : ${widget.items.date}'),
//            const SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(color: Colors.amber,
//               child: ListView.builder(scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics:NeverScrollableScrollPhysics(),
//               itemCount:widget.items.products.length ,
//               itemBuilder: (context, index) {
//                 return Column(crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
//                       child: Text('Product Id  : ${widget.items.products[index]['productId'].toString()}'),
//                     ),
//                                                   //  const SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.only(bottom:8.0,left: 8,right:8.0),
//               child: Text('Quanity : ${widget.items.products[index]['quantity'].toString()}'),
//             ),


//                   ],
//                 ) ;
//               },
// //               children: [
                
// // widget.items.products[0]['productId'].toString() ==null ? const Text('null')  :
// //                 Text('Product Id 1 : ${widget.items.products[0]['productId'].toString()}') ,


// // widget.items.products[1]['productId'].toString() ==null ? const Text('null')  :
// //             Text('Product Id 2 : ${widget.items.products[1]['productId'].toString()}'),
            

// // // ignore: unnecessary_null_comparison
// // widget.items.products[2]['productId'].toString() == null ? const Text('null')  :
// //               Text('Product Id 3 : ${widget.items.products[2]['productId'].toString()}'
// //)
//        // )  ],
//             )),
//           ),
//              const SizedBox(height: 20,),
//           ],
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
