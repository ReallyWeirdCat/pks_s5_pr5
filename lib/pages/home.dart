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
          title: "Неизвестный овощ",
          description: "",
          photo: "",
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
      body: products.isEmpty ? const Center(child: Text('Сегодня мы здесь одни')) : ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return Dismissible(
              key: Key(product.title),
              direction: DismissDirection.startToEnd,
              background: Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Удалить",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
              ),
              child: ProductComponent( product: products[index]),
              onDismissed: (direction) =>
              {
                setState(() {
                  products.removeAt(index);
                })
              });


          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _addProduct,
        tooltip: 'Add Product',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}