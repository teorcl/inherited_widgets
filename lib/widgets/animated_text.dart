import 'package:flutter/material.dart';
import 'package:inherited_widgets/pages/my_home_page.dart';
import 'package:inherited_widgets/state_management/consumer.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Consumer<MyHomePageController>(
          builder: (_, controller) {
            return Text(
              key: UniqueKey(),
              '${controller.counter}',
              style: const TextStyle(
                fontSize: 45,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
