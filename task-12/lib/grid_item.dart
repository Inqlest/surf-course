import 'detail_page.dart';
import 'package:flutter/material.dart';
import 'color_info.dart';
import 'package:flutter/services.dart';

class GridItem extends StatelessWidget {
  final int index;
  final List<dynamic> colors;
  const GridItem({super.key, required this.index, required this.colors});
  @override
  Widget build(BuildContext context) {
    ColorInfo colorInfo = ColorInfo.fromJson(colors[index]);
    String colorName = colorInfo.colorName;
    String hex = colorInfo.hex ?? 'No hex';
    return Column(children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () => _goToDetailPage(context, hex, colorName),
            onLongPress: () => copy(context, hex),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: hex != 'No hex'
                    ? Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000)
                    : Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      Text('$colorName \n $hex'),
    ]);
  }
}

Future<void> _goToDetailPage(
    BuildContext context, String hex, String colorName) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailPage(hex: hex, color: colorName),
    ),
  );
}

void copy(BuildContext context, String hex) async {
  Clipboard.setData(ClipboardData(text: hex)).then((_) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('HEX скопирован')));
  });
}
