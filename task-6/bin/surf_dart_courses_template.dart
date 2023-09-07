abstract class Filter<T> {
  bool apply(T product);
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

  FilterByCategory(this.categoryFilter);

  @override
  bool apply(Product product) => product.category == categoryFilter;
}

class FilterByPrice extends Filter<Product> {
  final int maxPrice;

  FilterByPrice(this.maxPrice);

  @override
  bool apply(Product product) => product.price <= maxPrice;
}

class FilterByCount extends Filter<Product> {
  final int maxCount;

  FilterByCount(this.maxCount);

  @override
  bool apply(Product product) => product.count < maxCount;
}

bool applyFilters(List<Product> products, Filter<Product> filter) {
  List<Product> filteredProducts = products.where((product) {
    return filter.apply(product);
  }).toList();

  if (filteredProducts.isEmpty) {
    print("Нет продуктов, соответствующих критериям фильтра.");
    return false;
  }

  print("Отфильтрованные продукты:");
  print("ID\tНазвание\tКатегория\tЦена\tКоличество");
  for (var product in filteredProducts) {
    print(
        "${product.id}\t${product.name}\t${product.category}\t${product.price} руб.\t${product.count} шт.");
  }
  return true;
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

  final categoryFilter = FilterByCategory("Бородинский");
  final priceFilter = FilterByPrice(250);
  final countFilter = FilterByCount(10);

  applyFilters(productList, categoryFilter);
  applyFilters(productList, priceFilter);
  applyFilters(productList, countFilter);
}
