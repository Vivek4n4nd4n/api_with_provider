import 'package:api_models/model/home_productlist.dart';
import 'package:api_models/model/productlist.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ShowListPage extends StatefulWidget {
  HomeProductList items;
  ShowListPage({super.key, required this.items});

  @override
  State<ShowListPage> createState() => _ShowListPageState();
}

class _ShowListPageState extends State<ShowListPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Select to Cart'),
        actions: [
          TextButton.icon(
                      onPressed: () {
                        
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                    ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height, width: width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19, right: 60),
                      child: Text(widget.items.id.toString()),
                    ),
                    Text(widget.items.category),
                     const Spacer(),
              Text( 'price: \$ ${widget.items.price.toString()}'),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: height * 0.5,
                    width: width * 0.90,
                    child: Image.network(
                      widget.items.image,
                    )),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.items.description),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                    Text( 'Rating Rate : ${widget.items.rating['rate'].toString()}',style: TextStyle(color: Colors.green),),
                    SizedBox(width: 30,),
                      Text('Rating Count : ${widget.items.rating['count'].toString()}',style: TextStyle(color: Colors.green),),
                    ],
                  ),
                )
              ],
            ),
          
          ),
        ),
      ),
    );
  }
}
