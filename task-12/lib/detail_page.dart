import 'package:coloredbox/grid_item.dart';
import 'package:flutter/material.dart';
import 'color_box.dart';

class DetailPage extends StatelessWidget {
  final String color;
  final String hex;

  const DetailPage({super.key, required this.color, required this.hex});

  @override
  Widget build(BuildContext context) {
    final Color colorValue =
        Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorValue,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 375,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorValue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              color,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () => copy(context, hex),
                child: ColorBox(
                  text1: "HEX",
                  text2: hex,
                  width: 343,
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  ColorBox(
                    text1: ("Red"),
                    text2: colorValue.red.toString(),
                    width: 103,
                  ),
                  ColorBox(
                    text1: ("Green"),
                    text2: colorValue.green.toString(),
                    width: 103,
                  ),
                  ColorBox(
                    text1: ("Blue"),
                    text2: colorValue.blue.toString(),
                    width: 103,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
