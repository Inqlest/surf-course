import 'package:flutter/material.dart';
import 'source.dart';
import 'dart:convert';
import 'grid_item.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});
  @override
  Widget build(BuildContext context) {
    final List<dynamic> allColors = jsonDecode(source)['colors'];
    final List<dynamic> colors =
        allColors.where((color) => color['value'] != null).toList();

    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Эксклюзивная палитра \n«Colored Box»',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 40),
              itemCount: colors.length,
              itemBuilder: (context, index) => GridItem(
                index: index,
                colors: colors,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
