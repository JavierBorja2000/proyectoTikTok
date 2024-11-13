import 'package:flutter/material.dart';

const Color _defaultColor = Colors.green;

const List<Color> _colorsTheme = [
  _defaultColor,
  Colors.indigo,
  Colors.red,
  Colors.purple,
  Color.fromARGB(255, 226, 0, 121),
  Colors.deepPurpleAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= 5,
            "SelectedColor must be between 0 and 5");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: _colorsTheme[selectedColor]);
  }
}
