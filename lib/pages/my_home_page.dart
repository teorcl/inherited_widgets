import 'package:flutter/material.dart';
import 'package:inherited_widgets/state_management/consumer.dart';
import 'package:inherited_widgets/state_management/teo_provider.dart';
import 'dart:math' as math;
import 'package:inherited_widgets/widgets/counter_text.dart';

import '../global/theme_controller.dart';
import '../main.dart';

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
        actions: [
          Consumer<ThemeController>(
            builder: (_, controller) {
              return Switch(
                value: controller.isDarkModeEnable,
                activeColor: Colors.redAccent,
                onChanged: (_) {
                  controller.toggleTheme();
                },
              );
            },
          )
        ],
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
            Builder(
              builder: (contextBuilder) {
                return Text('Dentro del Widget Builder');
              },
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
    bool shouldNotify =
        oldWidget.counter != counter || oldWidget.color != color;

    return shouldNotify;
  }

  static MyHomePageProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<MyHomePageProvider>();
    assert(
      provider != null,
      'El contexto usado no es el contexto de un hijo de MyHomePageProvider',
    );

    return provider!;
  }
}
