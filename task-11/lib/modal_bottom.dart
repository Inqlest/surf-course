import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:async';

Future<List<ProductEntity>> modal(BuildContext context, List<ProductEntity> data) async {
  final completer = Completer<List<ProductEntity>>();
  List<String> option = [
    'Без Сортировки',
    'По имени от А до Я',
    'По имени от Я до А',
    'По возрастанию',
    'По убыванию',
    'По типу от А до Я',
    'По типу от Я до А'
  ];
  String currentOption = option[0];
  List<ProductEntity> dataSorted = List.from(data);
  List<ProductEntity> originalData = List.from(data);
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 5,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21.0,
                  vertical: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Сортировка",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Закрыть модальное окно
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < option.length; i++)
                RadioListTile(
                    title: Text(option[i]),
                    activeColor: const Color.fromRGBO(103, 205, 0, 1),
                    value: option[i],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                        if (currentOption == option[0]) {
                          completer.complete(originalData); // Возвращаем исходные данные
                        } else if (currentOption == option[1]) {
                          dataSorted.sort((a, b) => a.title.compareTo(b.title));
                          completer.complete(dataSorted);
                        } else if (currentOption == option[2]) {
                          dataSorted.sort((b, a) => a.title.compareTo(b.title));
                          completer.complete(dataSorted);
                        } else if (currentOption == option[3]) {
                          dataSorted.sort((a, b) => a.price.compareTo(b.price));
                          completer.complete(dataSorted);
                        } else if (currentOption == option[4]) {
                          dataSorted.sort((b, a) => a.price.compareTo(b.price));
                          completer.complete(dataSorted);
                        }
                        Navigator.pop(context); // Закрыть модальное окно
                      });
                    })
            ],
          );
        });
      });
  return completer.future;
}
