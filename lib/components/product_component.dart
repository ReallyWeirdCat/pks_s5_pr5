import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/details.dart';
import 'package:pcs3_sem5/models/product.dart';
import 'package:pcs3_sem5/util/string_utils.dart';

class ProductComponent extends StatefulWidget {
  ProductComponent({required this.product, required this.sstate});

  final Product product;
  final Function sstate;
  @override
  ProductComponentState createState() => ProductComponentState(product: product, sstate: sstate);
}

class ProductComponentState extends State<ProductComponent> {
  ProductComponentState({required this.product, required this.sstate});

  final Product product;
  final Function sstate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Details(product: product))),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.001,
              right: MediaQuery.of(context).size.width * 0.001
          ),
          decoration: BoxDecoration(color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0)),
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          //height: MediaQuery.of(context).size.width * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: product.photo != "" ? NetworkImage(product.photo) : const AssetImage("images/sample_food.png"),
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  fit: BoxFit.cover)
              ),
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
              Text(
                truncateString(product.description != "" ? product.description : "Без описания", 32),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    color: Colors.grey[800]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    width: MediaQuery.of(context).size.height * 0.06,
                    height: MediaQuery.of(context).size.height * 0.04,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      product.price > 0 ? "${product.price - product.price * product.discount / 100} р" : "FREE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  product.discount <= 0 ? Container() :  Container(
                    padding: EdgeInsets.all(1),
                    width: MediaQuery.of(context).size.height * 0.06,
                    height: MediaQuery.of(context).size.height * 0.04,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "${product.discount}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){

                        product.isFavorite = !product.isFavorite;
                        setState(() {
                        });
                      },
                      icon: product.isFavorite ?
                      const Icon(Icons.favorite) :
                      const Icon(Icons.favorite_outline),
                  )
                ]
              )
            ],

          )
        ),
      ),
    );
  }
}