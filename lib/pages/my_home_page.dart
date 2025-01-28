import 'package:flutter/material.dart';
import 'package:inherited_widgets/state_management/consumer.dart';
import 'package:inherited_widgets/state_management/teo_provider.dart';
import 'dart:math' as math;
import 'package:inherited_widgets/widgets/counter_text.dart';

import '../global/theme_controller.dart';
import '../state_management/notifier.dart';

class MyHomePageController extends ProviderNotifier {
  int _counter = 0;
  Color _color = Colors.blue;

  int get counter => _counter;
  Color get color => _color;

  void _incrementCounter() {
    final index = math.Random().nextInt(Colors.primaries.length - 1);
    _color = Colors.primaries[index];
    _counter++;
    notify();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TeoProvider<MyHomePageController>(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Flutter Demo Home Page'),
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
              const CounterText(),
              Builder(
                builder: (contextBuilder) {
                  return Text('Dentro del Widget Builder');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (contextBuilder) {
          return FloatingActionButton(
            onPressed: () {
              TeoProvider.of<MyHomePageController>(contextBuilder)
                  ._incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        }),
      ),
      create: () => MyHomePageController(),
    );
  }
}
