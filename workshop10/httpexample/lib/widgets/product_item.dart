import 'package:flutter/material.dart';
import 'package:httpexample/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            shadowColor: Color.fromARGB(255, 40, 78, 192),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 10.0,
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 200.0,
                    child: Image.network(
                      product.thumbnail.toString(),
                      width: 350,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Center(
                      child: Text(
                        product.title.toString(),
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "% " + product.discountPercentage.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.amber),
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          product.price.toString() + "₺",
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            )));
  }
}
