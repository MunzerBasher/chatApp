import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  IconData _icon = Icons.dark_mode;

  IconData get icon => _icon;
  ThemeMode get themeMode => _themeMode;
  bool isOn = false;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    _themeMode =
        (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    _icon =
        (_themeMode == ThemeMode.light) ? Icons.dark_mode : Icons.light_mode;
    notifyListeners();
  }
}
