import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 2;

  // Список иконок для каждой вкладки
  final List<IconData> _icons = [
    Icons.article_outlined,
    Icons.search,
    Icons.local_mall_outlined,
    Icons.person_outlined,
  ];

  // Список названий для каждой вкладки
  final List<String> _titles = [
    'Каталог',
    'Поиск',
    'Корзина',
    'Личное',
  ];

  // Обработчик нажатия на элемент навигационной панели
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Фиксированный тип, чтобы все элементы были видны
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: const Color.fromRGBO(103, 205, 0, 1),
      unselectedItemColor: const Color.fromRGBO(96, 96, 123, 1),
      items: List.generate(
        _icons.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(
            _icons[index],
          ),
          label: _titles[index],
        ),
      ),
    );
  }
}
