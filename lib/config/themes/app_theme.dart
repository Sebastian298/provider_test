import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Colors.black,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0,
            'Colors must be between 0 and ${_colorThemes.length} colors');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
