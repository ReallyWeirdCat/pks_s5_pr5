import 'package:pcs3_sem5/data/data.dart';
import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/product_component.dart';

import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  var products = <Product>[];

  void _addProduct() {
    setState(() {
      products.add(
        Product(
          id: data_products.length + 1,
          title: "Новый овощ",
          description: "",
          photo: "https://i.imgur.com/qHQPla7.png",
          price: 0,
          discount: 0
        )
      );
    });
  }

  void _removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Овощной')
        ),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: data_products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductComponent( product: data_products[index]);
          }
      ),
    );
  }
}