import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpexample/model/product.dart';
import 'package:httpexample/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    // http isteği ile ürünleri elde etmek
    Uri url = Uri.https("dummyjson.com", "products");
    final response = await http.get(url);
    final dataAsJson = json.decode(response.body);
    List<Product> products = [];
    for (var productResponse in dataAsJson["products"]) {
      products.add(Product.fromJson(productResponse));
    }

    setState(() {
      productList = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, index) => ProductItem(
          product: productList[index],
        ),
      ),
    );
  }
}
