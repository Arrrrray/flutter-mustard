import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<ThemeMode, String> _themeModeInfo = {
  ThemeMode.system: "跟随系统",
  ThemeMode.light: "正常模式",
  ThemeMode.dark: "暗色模式",
};

class SettingsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  ThemeMode get mode => _themeMode;
  Map<ThemeMode, String> get modeInfo => _themeModeInfo;

  List<ThemeMode> get modes => [
        ThemeMode.system,
        ThemeMode.light,
        ThemeMode.dark,
      ];

  SettingsProvider() {
    setup();
  }

  void setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt('theme_mode') ?? 0;
    if (index < 0 || index >= ThemeMode.values.length) {
      index = 0;
    }
    _themeMode = ThemeMode.values[index];

    notifyListeners();
  }

  void switchThemeModeTo(ThemeMode value) async {
    _themeMode = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', value.index);
  }
}
