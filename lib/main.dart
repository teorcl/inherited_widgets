import 'package:flutter/material.dart';

import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnable = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkModeEnable = !_isDarkModeEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      toggleDarkMode: _toggleDarkMode,
      isDarkModeEnable: _isDarkModeEnable,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: _isDarkModeEnable ? ThemeData.dark() : ThemeData.light(),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class ThemeProvider extends InheritedWidget {
  final bool isDarkModeEnable;
  final void Function() toggleDarkMode;

  const ThemeProvider({
    super.key,
    required this.isDarkModeEnable,
    required super.child,
    required this.toggleDarkMode,
  });

  static ThemeProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(
      provider != null,
      'El contexto usado no es el contexto de un hijo de ThemeProvider',
    );

    return provider!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return isDarkModeEnable != oldWidget.isDarkModeEnable;
  }
}
