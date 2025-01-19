import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:inherited_widgets/widgets/counter_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _color = Colors.blue;

  void _incrementCounter() {
    setState(() {
      final index = math.Random().nextInt(Colors.primaries.length - 1);
      _color = Colors.primaries[index];
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 16),
            MyHomePageProvider(
              counter: _counter,
              color: _color,
              child: const CounterText(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePageProvider extends InheritedWidget {
  final int counter;
  final Color color;

  const MyHomePageProvider({
    super.key,
    required this.counter,
    required this.color,
    required super.child,
  });

  @override
  bool updateShouldNotify(MyHomePageProvider oldWidget) {
    return true;
  }
}
