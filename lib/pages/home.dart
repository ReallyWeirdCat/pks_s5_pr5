import 'dart:math';

import 'package:flutter/services.dart';
import 'package:pcs3_sem5/data/data.dart';
import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/product_component.dart';

import '../models/product.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  var products = <Product>[];

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final photoController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    photoController.dispose();
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

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
              child: ProductComponent(product: products[index]),
              confirmDismiss: (DismissDirection direction) async {
                if (direction == DismissDirection.startToEnd) {return true;}
                if (direction == DismissDirection.endToStart) {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {

                      titleController.text = products[index].title;
                      descriptionController.text = products[index].description;
                      photoController.text = products[index].photo;
                      priceController.text = products[index].price.toString();
                      discountController.text = products[index].discount.toString();
                      return Dialog(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Редактирование", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                              TextFormField(
                                  controller: titleController,
                                  //initialValue: products[index].title,
                                  decoration: InputDecoration(

                                    hintText: "Название",
                                  )),
                              TextFormField(
                                  controller: descriptionController,
                                  //initialValue: products[index].description,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: "Описание",
                                  )),
                              TextFormField(
                                  controller: photoController,
                                  //initialValue: products[index].photo,
                                  decoration: InputDecoration(
                                    hintText: "Фото (URL)",
                                  ),
                              ),
                              TextFormField(
                                  controller: priceController,
                                  //initialValue: products[index].price.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Цена",
                                  )),
                              TextFormField(
                                  controller: discountController,
                                  //initialValue: products[index].discount.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Скидка",
                                  )),
                              Container(margin: const EdgeInsets.symmetric(vertical: 16.0),),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.green
                                ),
                                onPressed: () {
                                  products[index].title = titleController.text;
                                  products[index].description = descriptionController.text;
                                  products[index].price = priceController.text.isNotEmpty ? double.parse(priceController.text) : 0;
                                  products[index].photo = photoController.text;
                                  products[index].discount =  discountController.text.isNotEmpty ? int.parse(discountController.text) : 0;

                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                                child: const Text("Сохранить"),
                              ),
                            ]
                          )
                        ),
                      );
                    },
                  );
                  //setState(() {});
                  return false;
                }
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