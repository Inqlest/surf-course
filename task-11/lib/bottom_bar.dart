import 'package:flutter/material.dart';
import 'data.dart';

class BottomBar extends StatelessWidget {
  final List<ProductEntity> data;
  const BottomBar({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int checkSum = 0;
    int discount = 0;
    int totalSum = 0;
    // Рассчет общей суммы и итоговой суммы со скидкой
    //checkSum = data.fold(0, (prev, product) => prev + product.price);
    for (int i = 0; i < data.length; i++) {
      data[i].sale != 0 ? checkSum += ((data[i].price * data[i].sale) ~/ 100) : checkSum += data[i].price;
    }
    discount = (checkSum * 5) ~/ 100;
    totalSum = checkSum - discount;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Divider(
        height: 1,
        thickness: 1,
        indent: 20,
        endIndent: 20,
        color: Color.fromRGBO(241, 241, 241, 1),
      ), // Заголовок итоговой корзины
      const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        child: Text(
          'В вашей покупке',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // Кол-во товаров в корзине и их сумма
      Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${data.length} товаров\n ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text('${checkSum / 100} руб',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),

              // Скидка
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Скидка 5% \n',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text('-${discount / 100} руб',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),

              // Итоговая сумма со скидкой
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Итого\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('${totalSum / 100} руб',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromRGBO(241, 241, 241, 1),
              ), // Заголовок итоговой корзины
            ],
          ))
    ]);
  }
}
