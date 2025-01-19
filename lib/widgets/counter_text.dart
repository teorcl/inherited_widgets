import 'package:flutter/material.dart';
import 'package:inherited_widgets/pages/my_home_page.dart';
import 'package:inherited_widgets/widgets/animated_text.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        context.dependOnInheritedWidgetOfExactType<MyHomePageProvider>()!;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: homeProvider.color,
        shape: BoxShape.circle,
      ),
      child: const AnimatedText(),
    );
  }
}
