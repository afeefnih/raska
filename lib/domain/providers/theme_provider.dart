import 'package:flutter/material.dart';
import '../../config/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  // Toggle between light and dark theme
  void toggleTheme(bool isDarkMode) {
    _themeData = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners(); // Notify listeners to update the UI
  }
}
