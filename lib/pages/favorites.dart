import 'dart:math';

import 'package:flutter/services.dart';
import 'package:pcs3_sem5/data/data.dart';
import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/product_component.dart';

import '../models/product.dart';
import 'details.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {

  var products = dataProducts;
  var favorites = dataProducts.where((x) => x.isFavorite).toList();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  void _addProduct() {
    setState(() {
      products.add(
          Product(
              id: dataProducts.length + 1,
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
            child: Text('Любимое')
        ),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      body: favorites.isEmpty ? const Center(child: Text('Вы не закусывали')) : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            final product = favorites[index];
            return Dismissible(
              key: Key(product.title + index.toString() + Random().nextInt(100).toString()),
              direction: DismissDirection.horizontal, // Allow swiping in both directions
              background: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Удалить",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              secondaryBackground: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: const Text(
                  "Править",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              child: ProductComponent(product: favorites[index], sstate: setState,),
              confirmDismiss: (DismissDirection direction) async {
                if (direction == DismissDirection.startToEnd) {return true;}
                return null;
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  setState(() {
                    products.removeAt(index);
                  });
                } else if (direction == DismissDirection.endToStart) {

                }
              },
            );
          }

      )
    );
  }
}