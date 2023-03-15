import 'package:api_models/home/classes/showlistpage.dart';
import 'package:api_models/model/productlist.dart';
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  String image;
  String title;
  String description;
  String category;

  var rating;
  ProductList items;
  var price;
  int id;
  ItemView(
      {required this.title,
      required this.category,
      required this.image,
      required this.price,
      required this.description,
      required this.id,
      required this.items,
      required this.rating,
      super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return
        //  appBar: AppBar(title:Text("P") ,),
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 47, 232, 143),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Row(
                children:const [
                  // Text(widget.rate),
                  // Text(widget.count.toString())
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(widget.id.toString()),
                  ),
                  const SizedBox(
                    width: 04,
                  ),
                  Text(widget.category),
                ],
              ),
              //  SizedBox(height: 10,),
              //  FittedBox(child: Text(widget.title)),

              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShowListPage(items: widget.items
                              // image:snapshot.data![index].image,
                              // category:snapshot.data![index].category,
                              // description:snapshot.data![index].description
                             // )));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: 150,
                  height: 100,
                  // ignore: unnecessary_null_comparison
                  child: Image == null
                      ? const Icon(Icons.image)
                      : Image.network(
                          widget.image,
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),

              const SizedBox(
                height: 4,
              ),
              Text('price: \$ ${widget.price.toString()}')
              // Text(widget.description),
            ],
          )),
    );
  }
}
