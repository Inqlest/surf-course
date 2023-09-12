import 'package:flutter/material.dart';

void main() {
  runApp(const SurfApp());
}

class SurfApp extends StatelessWidget {
  const SurfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePageStateful(title: 'Counter V2.0'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String title;

  const HomePageStateful({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  int _counter = 0;
  int _minusCount = 0;
  int _plusCount = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
      _plusCount += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter -= 1;
      }
      _minusCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Text(
            'Всего Вы натыкали кнопочки на',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
            const Text(
              'На минус вы тыкнули ',
            ),
            Text(
              '$_minusCount раз',
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const Text(
              'На плюс вы тыкнули ',
            ),
            Text(
              '$_plusCount раз',
            ),
          ])
        ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
