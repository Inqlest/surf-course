abstract class Filter<T> {
  final List<T> _products;

  Filter(this._products);

  List<T> apply();
}

class Product {
  final int id;
  final String name;
  final String category;
  final int price;
  final int count;

  Product(this.id, this.name, this.category, this.price, this.count);
}

class FilterByCategory extends Filter<Product> {
  final String categoryFilter;

  FilterByCategory(List<Product> products, this.categoryFilter)
      : super(products);

  @override
  List<Product> apply() =>
      _products.where((product) => product.category == categoryFilter).toList();
}

class FilterByPrice extends Filter<Product> {
  final int maxPrice;

  FilterByPrice(List<Product> products, this.maxPrice) : super(products);

  @override
  List<Product> apply() =>
      _products.where((product) => product.price <= maxPrice).toList();
}

class FilterByCount extends Filter<Product> {
  final int maxCount;

  FilterByCount(List<Product> products, this.maxCount) : super(products);

  @override
  List<Product> apply() =>
      _products.where((product) => product.count < maxCount).toList();
}

void main() {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  List<Product> productList = [];
  List<String> lines = articles.trim().split('\n');

  for (String line in lines) {
    List<String> articleData = line.trim().split(',');
    productList.add(Product(
        int.parse(articleData[0]),
        articleData[1],
        articleData[2],
        int.parse(articleData[3]),
        int.parse(articleData[4])));
  }

  final categoryFilter = FilterByCategory(productList, "Бородинский");
  final priceFilter = FilterByPrice(productList, 250);
  final countFilter = FilterByCount(productList, 10);

  applyFilter(categoryFilter);
  applyFilter(priceFilter);
  applyFilter(countFilter);
}

void applyFilter(Filter<Product> filter) {
  List<Product> filteredProducts = filter.apply();

  print("Filtered products:");
  print("ID\tName\tCategory\tPrice\tCount");
  for (var product in filteredProducts) {
    print(
        "${product.id}\t${product.name}\t${product.category}\t${product.price} руб.\t${product.count} шт.");
  }
  print("\n");
}
