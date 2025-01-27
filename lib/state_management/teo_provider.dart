import 'package:flutter/material.dart';

import 'notifier.dart';

class TeoProvider<T extends ProviderNotifier> extends StatefulWidget {
  final Widget child;
  final T Function() create;

  const TeoProvider({
    super.key,
    required this.child,
    required this.create,
  });

  @override
  State<TeoProvider<T>> createState() => _TeoProviderState<T>();

  // Al ser un metodo estatico, el T no es el mismo que el T del StatefulWidget, por eso se usa el T extends ProviderNotifier
  static T of<T extends ProviderNotifier>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_InheritedWidget<T>>();

    assert(
      provider != null,
      'The context used is not the context of a child of TeoProvider',
    );

    return provider!.notifier;
  }
}

class _TeoProviderState<T extends ProviderNotifier>
    extends State<TeoProvider<T>> {
  late final T _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = widget.create();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(
      notifier: _notifier,
      child: widget.child,
    );
  }
}

class _InheritedWidget<T extends ProviderNotifier> extends InheritedWidget {
  final T notifier;

  const _InheritedWidget({
    super.key,
    required this.notifier,
    required super.child,
  });

  @override
  bool updateShouldNotify(_) => false;
}
