import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/details.dart';
import 'package:pcs3_sem5/models/product.dart';
import 'package:pcs3_sem5/util/string_utils.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Details(product: product))),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05
          ),
          decoration: BoxDecoration(color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0)),
          //height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: NetworkImage(product.photo),
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.cover)
              ),
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
              Text(
                truncateString(product.description, 70),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: Colors.grey[800]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    width: MediaQuery.of(context).size.height * 0.12,
                    height: MediaQuery.of(context).size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "${product.price} р",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  product.discount == 0 ? Container() :  Container(
                    padding: EdgeInsets.all(1),
                    width: MediaQuery.of(context).size.height * 0.12,
                    height: MediaQuery.of(context).size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "${product.discount}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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