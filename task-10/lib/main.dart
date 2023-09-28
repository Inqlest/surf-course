import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(title: 'Визитка'),
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
  final Image _profile = Image.asset('assets/MyPhoto.jpg');
  final Image _vsuet = Image.asset('assets/VSUET.jpg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _profile.image,
                  ))),
          const Text('Цой Илья Вадимович', style: TextStyle(fontSize: 21, color: Colors.white, fontFamily: 'Bear'))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image(
            image: _vsuet.image,
            width: 175,
            height: 175,
          ),
          const Flexible(child: Text('Cтудент 4 курса факультета ИБАС во ВГУИТ', style: TextStyle(fontSize: 21, color: Colors.white, fontFamily: 'Muller')))
        ]),
        const Text('Увлекаюсь программированием и компьютерными играми\n', style: TextStyle(fontSize: 21, color: Colors.white, fontFamily: 'Post')),
        const Text('Коммерческого опыта в разработке у меня, к сожалению, нет. Лишь годы учебы, проб и ошибок', style: TextStyle(fontSize: 21, color: Colors.white, fontFamily: 'Brush'))
      ]),
    );
  }
}
