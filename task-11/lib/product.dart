import 'package:flutter/material.dart';
import 'data.dart';

class Product extends StatelessWidget {
  final List<ProductEntity> data;
  const Product({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        // Обернуть ListView в Expanded
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final list = data[index];
              return ListTile(
                  //Изображение
                  leading: Image.network(
                    list.imageUrl,
                    fit: BoxFit.cover,
                    width: 68,
                    height: 68,
                  ),
                  // Название
                  title: Text(
                    list.title,
                    style: const TextStyle(fontSize: 12),
                  ),
                  // Цена
                  trailing: Text(
                    '${list.price < 100 ? list.price / 100 : list.price ~/ 100} руб',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  // Количество
                  subtitle: Text(
                    ' ${list.amount is Grams ? list.amount.value / 1000 : list.amount.value} ${list.amount is Grams ? 'кг' : "шт"}',
                    style: const TextStyle(fontSize: 12, color: Color.fromRGBO(37, 40, 73, 1)),
                  ));
            }));
  }
}
