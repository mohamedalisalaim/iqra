import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      // background
      surface: const Color.fromRGBO(16, 16, 18, 1),

      // green color for buttons
      primary: const Color.fromRGBO(80, 200, 120, 1),

      // secondary for interactive objects
      secondary: Colors.grey.shade900,
    ),
  );

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      // background
      surface: const Color.fromRGBO(244, 244, 244, 1),

      // green color for buttons
      primary: const Color.fromRGBO(80, 200, 120, 1),

      // secondary for interactive objects
      secondary: Colors.grey.shade200,
    ),
  );

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}



// primary: const Color.fromRGBO(125, 226, 96, 1),