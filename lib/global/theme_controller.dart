import '../state_management/notifier.dart';

class ThemeController extends ProviderNotifier {
  bool _isDarkModeEnable = false;

  bool get isDarkModeEnable => _isDarkModeEnable;

  void toggleTheme() {
    _isDarkModeEnable = !_isDarkModeEnable;
    notify();
  }
}
