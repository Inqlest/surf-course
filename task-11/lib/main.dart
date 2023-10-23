import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navigation_bar.dart';
import 'data.dart';
import 'bottom_bar.dart';
import 'Product.dart';
import 'modal_bottom.dart';
/// Это не готовый вариант у меня есть пару вопросов
/// 1. Почему в modal_bottom что бы я не делал не получается вернуть исходный список?
/// 2. Как добавить разделительные полосы как в макете?
/// 3. Как выводить список по категориям?
/// 4. Как сохранять выбранный метод сортировки при закрытии модального окна?
/// 5. Sale в процентах?
/// Помогите с этим, а то я уже почти месяц пишу и глаз подергивается:)

/// Цена товара в копейках. Без скидки.
///
/// Подумайте и ответьте на три вопроса:
/// 1. Почему цена хранится в копейках, а не в рублях?
/// 2. Почему тип данных цены - [int], а не [double]?
/// 3. Как можно было реализовать передачу цены иначе?
///
/// Ответы на вопросы разместите тут (они будут проверены при код-ревью):
/// 1. Цена товара хранится в копейках, для избежания потери точности при работе с денежными значениями.
/// 2. Чтобы избежать проблем с плавающей точкой, которые могут возникнуть при выполнении операций с денежными значениями
/// 3. Затрудняюсь ответить.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Шесторочка'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int checkNumber = 1;
  late List<ProductEntity> currentData = dataForStudents;
  Future<void> sortButton() async {
    List<ProductEntity>? sortedData = await modal(context, currentData); // Use await here

    setState(() {
      currentData = sortedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd.M.yy в kk:mm').format(now);
    return Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Column(children: [
            //Номер чека
            Text(
              "Чек № $checkNumber",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            //Дата
            Text(
              formattedDate,
              style: const TextStyle(color: Color.fromRGBO(96, 96, 123, 1), fontSize: 10),
            ),
          ]),

          //Стрелочка назад
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.lightGreen,
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,

        // Список покупок
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Текст
                const Text('Список покупок',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )),
                //Кнопка с GestureDetector
                GestureDetector(
                    onTap: sortButton,
                    child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(color: const Color.fromRGBO(241, 241, 241, 1), borderRadius: BorderRadius.circular(6)),
                        child: const Icon(
                          Icons.sort,
                        ))),
              ])),

          // Вводим ListView
          Product(
            data: currentData,
          ),
          // Выводим нижнюю панель
          BottomBar(
            data: currentData,
          )
        ]));
  }
}
