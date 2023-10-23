import 'package:flutter/material.dart';
import 'data.dart';

class BottomBar extends StatelessWidget {
  final List<ProductEntity> data;
  const BottomBar({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int checkSum = 0;
    int discount = 31000;
    int totalSum = 0;

    // Рассчет общей суммы и итоговой суммы со скидкой
    checkSum = data.fold(0, (prev, product) => prev + product.price);
    totalSum = checkSum - discount;

    return Column(
      children: [
        // Заголовок итоговой корзины
        const Text(
          'В вашей покупке\n',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        // Кол-во товаров в корзине и их сумма
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data.length} товаров ',
                style: const TextStyle(fontSize: 12),
              ),
              Text('${checkSum ~/ 100} руб',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),

        // Скидка
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Скидка 5%',
                style: TextStyle(fontSize: 12),
              ),
              Text('-${discount ~/ 100} руб',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),

        // Итоговая сумма со скидкой
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 11.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Итого',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('${totalSum ~/ 100} руб',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
