import 'package:flutter/material.dart';
import 'package:inherited_widgets/global/theme_controller.dart';
import 'package:inherited_widgets/state_management/consumer.dart';

import 'pages/my_home_page.dart';
import 'state_management/teo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TeoProvider<ThemeController>(
      create: () => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (_, controller) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: controller.isDarkModeEnable
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

// class ThemeProvider extends InheritedWidget {
//   final bool isDarkModeEnable;
//   final void Function() toggleDarkMode;

//   const ThemeProvider({
//     super.key,
//     required this.isDarkModeEnable,
//     required super.child,
//     required this.toggleDarkMode,
//   });

//   static ThemeProvider of(BuildContext context) {
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
//     assert(
//       provider != null,
//       'El contexto usado no es el contexto de un hijo de ThemeProvider',
//     );

//     return provider!;
//   }

//   @override
//   bool updateShouldNotify(ThemeProvider oldWidget) {
//     return isDarkModeEnable != oldWidget.isDarkModeEnable;
//   }
// }
