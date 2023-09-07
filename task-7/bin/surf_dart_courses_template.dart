class RawProductItem {
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;
  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });
}

class FilteredProduct {
  String name;
  String categoryName;
  String subcategoryName;
  DateTime expirationDate;
  int qty;

  FilteredProduct({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });
}

void filterProducts(List<RawProductItem> product) {
  Map<String, Map<String, List<FilteredProduct>>> categories = {};
  for (var product in product) {
    if (product.expirationDate.isAfter(DateTime.now()) && product.qty > 0) {
      var filteredProduct = FilteredProduct(
        name: product.name,
        categoryName: product.categoryName,
        subcategoryName: product.subcategoryName,
        expirationDate: product.expirationDate,
        qty: product.qty,
      );
      if (!categories.containsKey(product.categoryName)) {
        categories[product.categoryName] = {};
      }
      if (!categories[product.categoryName]!.containsKey(product.subcategoryName)) {
        categories[product.categoryName]![product.subcategoryName] = [];
      }
      categories[product.categoryName]![product.subcategoryName]!.add(filteredProduct);
    }
  }
  List<FilteredProduct> finalSelection = [];

  for (var categoryEntry in categories.entries) {
    for (var subcategoryEntry in categoryEntry.value.entries) {
      finalSelection.addAll(subcategoryEntry.value);
    }
  }

  for (var categoryEntry in categories.entries) {
    print("Категория: ${categoryEntry.key}");
    for (var subcategoryEntry in categoryEntry.value.entries) {
      print("Подкатегория: ${subcategoryEntry.key}");
      for (var product in subcategoryEntry.value) {
        print(" ${product.name}, ${product.qty}");
      }
    }
    print("------------");
  }
}

void main() {
  final product = [
    RawProductItem(
      name: 'Персик',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2023, 09, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Молоко',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2023, 09, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Кефир',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Напитки',
      expirationDate: DateTime(2023, 09, 22),
      qty: 5,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2023, 09, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творожок',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2023, 09, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Творог',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Не напитки',
      expirationDate: DateTime(2023, 09, 22),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гауда',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2023, 09, 22),
      qty: 3,
    ),
    RawProductItem(
      name: 'Маасдам',
      categoryName: 'Молочные продукты',
      subcategoryName: 'Сыры',
      expirationDate: DateTime(2023, 09, 22),
      qty: 2,
    ),
    RawProductItem(
      name: 'Яблоко',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2023, 09, 4),
      qty: 4,
    ),
    RawProductItem(
      name: 'Морковь',
      categoryName: 'Растительная пища',
      subcategoryName: 'Овощи',
      expirationDate: DateTime(2023, 09, 23),
      qty: 51,
    ),
    RawProductItem(
      name: 'Черника',
      categoryName: 'Растительная пища',
      subcategoryName: 'Ягоды',
      expirationDate: DateTime(2023, 09, 25),
      qty: 0,
    ),
    RawProductItem(
      name: 'Курица',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2023, 09, 18),
      qty: 2,
    ),
    RawProductItem(
      name: 'Говядина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2023, 09, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Телятина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2023, 09, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Индюшатина',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2023, 09, 17),
      qty: 0,
    ),
    RawProductItem(
      name: 'Утка',
      categoryName: 'Мясо',
      subcategoryName: 'Птица',
      expirationDate: DateTime(2023, 09, 18),
      qty: 0,
    ),
    RawProductItem(
      name: 'Гречка',
      categoryName: 'Растительная пища',
      subcategoryName: 'Крупы',
      expirationDate: DateTime(2023, 09, 22),
      qty: 8,
    ),
    RawProductItem(
      name: 'Свинина',
      categoryName: 'Мясо',
      subcategoryName: 'Не птица',
      expirationDate: DateTime(2023, 09, 23),
      qty: 5,
    ),
    RawProductItem(
      name: 'Груша',
      categoryName: 'Растительная пища',
      subcategoryName: 'Фрукты',
      expirationDate: DateTime(2023, 09, 25),
      qty: 5,
    ),
  ];
  filterProducts(product);
}
