import 'dart:convert';

import 'package:api_models/productscreen/bottombar/bottombar_screen.dart';
import 'package:api_models/productscreen/bottombar/homescreen.dart';
import 'package:api_models/login/login_screen.dart';
import 'package:api_models/provider/cart/cart_provider.dart';
import 'package:api_models/provider/homelist/homeprovider.dart';
import 'package:api_models/provider/productlist/product_list_provider.dart';
import 'package:api_models/provider/userlist_provider/userlist_provider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' ;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp( MyApp(
    prefs:prefs
  ));
}

class MyApp extends StatelessWidget {
  
 SharedPreferences prefs;
   MyApp({super.key, required this.prefs});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
ChangeNotifierProvider(create:  (context) {
  return CartListProvider();
  
}
),
ChangeNotifierProvider(create: (context){
  return ProductListProvider();
}),

ChangeNotifierProvider(create: (context){
  return HomeProductListProvider();
}),

ChangeNotifierProvider(create: (context){
  return UserListProvider();
}),
ChangeNotifierProvider(create: (context){
  return HomeCategoryListProvider();
})
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute:'firstScreen',
        routes: {
          'firstScreen':(context){
            return prefs.getString('username')== null && prefs.getString('password') == null
             ? LoginScreen(title: 'Login Api')
             : BottomBarScreen();
          }
        },
    ) ,
    );
    
  }
}

