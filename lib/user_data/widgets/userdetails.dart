import 'package:api_models/model/userlist.dart';
import 'package:flutter/material.dart';

  
   // ignore: non_constant_identifier_names
   UserDetails(AsyncSnapshot<List<UserList>> snapshot, int index) {
    return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(height: 230,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 249, 249, 246),),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [ Text(snapshot.data![index].id.toString(),style: TextStyle(fontSize: 20),),
                                  SizedBox(width: 4,),
                                    Text('Name : ${snapshot.data![index].name['firstname'].toString()}',style: TextStyle(fontSize: 20),),
                                    SizedBox(width: 2,),
                                    Text(snapshot.data![index].name['lastname'].toString(),style: TextStyle(fontSize: 20),),
                                  
                                  ],
                                ),
                          
                              ),
                                Text('Phone : ${snapshot.data![index].phone}'),
                                 Text('Email : ${snapshot.data![index].email}'),
                                  Text('Username : ${snapshot.data![index].username}'),
                                   Text('Password : ${snapshot.data![index].password}'),
                                   Text('Address'),
                                   Row(
                                     children: [
                                       Text('Number : ${snapshot.data![index].address['number'].toString()}'),
                                        SizedBox(width: 2,),
                                       Text('${snapshot.data![index].address['street']} Street'),
                                     ],
                                   ),
                          Text('${snapshot.data![index].address['city']} City'),
                          Text('Zipcode  : ${snapshot.data![index].address['zipcode']}'),
                            ],),
                          ),
                          
                          
                          
                          
                          ),
                        );
  }


