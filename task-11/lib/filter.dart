import 'data.dart';

List<ProductEntity> dataFilter(String option, List<ProductEntity> data) {
  if (option == 'Без Сортировки') {
    return data;
  }
  // if (option == 'По типу') {
  //   return categoryFilter();
  // }

  List<ProductEntity> dataSorted = List.from(data);

  dataSorted.sort((a, b) {
    switch (option) {
      case 'По имени от А до Я':
        return a.title.compareTo(b.title);
      case 'По имени от Я до А':
        return b.title.compareTo(a.title);
      case 'По возрастанию':
        return a.price.compareTo(b.price);
      case 'По убыванию':
        return b.price.compareTo(a.price);

      default:
        // Вернуть исходные данные, если опция не распознана
        return 0;
    }
  });

  return dataSorted;
}
