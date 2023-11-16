import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model
class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
  }
}

// View
class MyHomePageView extends StatelessWidget {
  final String title;
  final int counter;
  final VoidCallback onPressed;

  MyHomePageView({
    required this.title,
    required this.counter,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Controller
class MyHomePageController {
  late CounterModel _model;
  late MyHomePageView _view;

  MyHomePageController() {
    _model = CounterModel();
    _view = MyHomePageView(
      title: 'Flutter Demo Home Page',
      counter: _model.counter,
      onPressed: _incrementCounter,
    );
  }

  Widget getView() {
    return _view;
  }

  void _incrementCounter() {
    _model.incrementCounter();
    _updateView();
  }

  void _updateView() {
    _view = MyHomePageView(
      title: 'Flutter Demo Home Page',
      counter: _model.counter,
      onPressed: _incrementCounter,
    );
  }
}

// Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyHomePageController controller = MyHomePageController();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: controller.getView(),
    );
  }
}
