import 'package:flutter/material.dart';
import 'data.dart';
import 'product_list.dart';

class CategoryFilter extends StatelessWidget {
  final List<ProductEntity> data;

  const CategoryFilter({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final product = data[index];

          // Проверяем, изменяется ли категория, и добавляем разделитель
          if (index == 0 || product.category != data[index - 1].category) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Text(
                      product.category.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )),
                ProductList(list: product),
              ],
            );
          }
          // Если категория не изменяется, просто отображаем продукт
          return ProductList(list: product);
        },
      ),
    );
  }
}
