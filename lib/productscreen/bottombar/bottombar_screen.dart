import 'package:api_models/model/carts_list.dart';
import 'package:api_models/productscreen/bottombar/cart.dart';
import 'package:api_models/productscreen/bottombar/homescreen.dart';
import 'package:api_models/productscreen/productlist_screen.dart';
import 'package:api_models/productscreen/bottombar/profile.dart';
import 'package:api_models/model/productlist.dart';
import 'package:api_models/productscreen/bottombar/usrdata.dart';
import 'package:api_models/user_data/widgets/list_of_products.dart';
import 'package:flutter/material.dart';
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
    int selectedIndex = 0;    
  String? barName = "Home";

  int currentScreenIndex = 0;
  static 
   final List<Widget> _widgetOptions = <Widget>[

   
  HomeScreen(
     id: 0, category: '', description: '', image: '', 
     
    ),
    const ProductListScreen(),
    const UserData(),
    UserCart(items:CartList(id: 0, userid: 0, products: '', date: '') ,),
 //  ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
     // appBarName(selectedIndex);
    });
  }

  void appBarName(int radians) {
    switch (radians) {
      case 0:
        barName = "Home";
        break;
      case 1:
      barName = "Products";
        break;
      case 2:
        barName = "Profile";
        break;
      //  case 3:
      //    barName = "user cart";
      //   break;
      //  case 4:
      //    barName = "Profile";
      //    break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 1,backgroundColor: Colors.white,title: Text(appBarName.toString()),
      // leading: BackButton(onPressed: (){Navigator.pop(context);},),),
      body:Center(child: _widgetOptions.elementAt(selectedIndex),) ,
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 1),
              ),
            ],
            color: Colors.blue,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: BottomNavigationBar(items:<BottomNavigationBarItem> [
            BottomNavigationBarItem(icon:selectedIndex==0
             ? const Icon(Icons.home_filled,size: 25,color:Colors.lightGreen ,)
             :const Icon(Icons.home,size: 20,color: Colors.blueGrey,),
             label: 'Home',),



             BottomNavigationBarItem(icon: selectedIndex == 1?
               const Icon(Icons.list_rounded,color:Colors.lightGreen)
             :Icon(Icons.list_outlined,color: Colors.blueGrey),
           
             label: 'Items',),



BottomNavigationBarItem(icon: selectedIndex ==2 ?

   const Icon(Icons.person,color:Colors.lightGreen)
             :Icon(Icons.person_2_outlined,color: Colors.blueGrey),
          
            label: 'profile',),




             BottomNavigationBarItem(icon: selectedIndex ==3 ?
               const Icon(Icons.production_quantity_limits,color:Colors.lightGreen)
             :const Icon(Icons.production_quantity_limits_outlined,color: Colors.blueGrey),
           
             
             label: 'user cart'),

//             BottomNavigationBarItem(icon: selectedIndex == 4 ?
//              const Icon(Icons.person)
//              :Icon(Icons.person_2_outlined),
//              label: 'profile')


          ],
          selectedLabelStyle: TextStyle(color: Colors.lightGreen),
          
          unselectedLabelStyle: TextStyle(color: Colors.red),
          currentIndex: selectedIndex,
          onTap:_onItemTapped ,
          
          ),
      ) ,
    );
  }
}