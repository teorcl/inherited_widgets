import 'package:flutter/material.dart';
import 'package:inherited_widgets/pages/my_home_page.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        context.dependOnInheritedWidgetOfExactType<MyHomePageProvider>()!;

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          key: UniqueKey(),
          '${homeProvider.counter}',
          style: const TextStyle(
            fontSize: 45,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
