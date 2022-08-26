import 'package:flutter/cupertino.dart';

import 'theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  final ThemePreferences _preferences = ThemePreferences();
  bool get isDark => _isDark;

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }
}
