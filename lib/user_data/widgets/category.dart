// import 'dart:convert';

// import 'package:flutter/material.dart';


// import 'package:http/http.dart' as http;
// class Catogries extends StatefulWidget {
//   const Catogries({super.key});

//   @override
//   State<Catogries> createState() => _CatogriesState();
// }

// class _CatogriesState extends State<Catogries> {
  
// var url = 'products';
//  Future fetchAlbum() async {
//     final response = await http.get(
//       Uri.parse("https://fakestoreapi.com/products/categories/"),
//     );

//     if (response.statusCode == 200) {
//       print("test ${response.body}");

//       final List result = const JsonDecoder().convert(response.body);

//       return result;
//     } else {
//       throw Exception('Data not loaded');
//     }
//   }
// int index = 0;

//   @override
//   Widget build(BuildContext context) {
  
   
//     return Expanded(
//           child: IndexedStack(
//             index: index,
//             children: [
//               FutureBuilder(
//                 future: fetchAlbum(),
//                 builder: (context, snapshot) {
//                   return Container(
//                     height: 300,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                   height: 100,
//                                   width: 120,
//                                   color: Colors.lightGreen,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(4.0),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           url =
//                                               'products/category/${snapshot.data![index]}';
//                                         });
//                                         print("hii${url}");
//                                       },
//                                       child: Container(
//                                         color: Colors.amber,
//                                         height: 200,
//                                         child: Center(
//                                             child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child:
//                                               Text("${snapshot.data[index]}"),
//                                         )),
//                                       ),
//                                     ),
//                                   )),
//                             ],
//                           );
//                         }),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//   }

//   }

