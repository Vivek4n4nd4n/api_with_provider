import 'dart:convert';

import 'package:api_models/model/productlist.dart';
import 'package:api_models/model/userlist.dart';
import 'package:api_models/provider/cart/cart_provider.dart';
import 'package:api_models/provider/userlist_provider/userlist_provider.dart';
import 'package:api_models/user_data/widgets/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  var url = 'users';

  // Future<List<UserList>> fetchAlbum() async {
  //   final response = await http.get(Uri.parse('https://fakestoreapi.com/$url'));
  //   if (response.statusCode == 200) {
  //     final List result = const JsonDecoder().convert(response.body);
  //     return result.map((e) => UserList.fromJson(e)).toList();
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
      Provider.of<UserListProvider>(context, listen: false).getAllCurtData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 201, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 154, 152),
        title: const Text('userdata'),
      ),

      body: Consumer<UserListProvider>(
        builder: (context, value, child) {
          final data = value.userList;
          return ListView.builder(
              itemCount: value.userList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 231, 235),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Text(
                                  data[index].id.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  data[index].name['firstname'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  data[index].name['lastname'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Text('phone: ${data[index].phone}'),
                          Text('email:${data[index].email}'),
                          Text('username:${data[index].username}'),
                          Text('password: ${data[index].password}'),
                          Text(
                            'Address',
                            style: TextStyle(fontSize: 17),
                          ),
                          Row(
                            children: [
                              Text(
                                  'number-${data[index].address['number'].toString()}'),
                              Text(
                                  '${data[index].address['street'].toString()} Street'),
                            ],
                          ),
                          Text('${data[index].address['city']} city'),
                          Text('${data[index].address['zipcode']}')
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      // body: Container(color: Colors.blueGrey,
      //  // height: 650,

      //   child: FutureBuilder<List<UserList>>(
      //       future: fetchAlbum(),
      //       builder: (context, snapshot) {
      //         return
      // ListView.builder(

      //             itemCount: snapshot.data!.length,
      //             itemBuilder: (context, index) {
      //               if (snapshot.hasData) {
      //                 return UserDetails(snapshot, index);
      //               } else {
      //                 if (snapshot.hasError) {
      //                   return const Center(
      //                     child: CircularProgressIndicator(),
      //                   );
      //                 }
      //               }
      //               return null;
      //             });
      //       }),
      // ),
    );
  }
}
