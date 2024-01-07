import 'package:flutter/material.dart';
import 'data.dart';
import 'product_list.dart';

class Product extends StatelessWidget {
  final List<ProductEntity> data;
  const Product({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final list = data[index];
        return ProductList(list: list);
      },
    ));
  }
}
