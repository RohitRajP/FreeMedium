import 'package:freemedium/imports.dart';

/// class to hold the globalThemes for the app
class GlobalThemes {
  // holds the application color constants
  static final Map<String, Color> _colorConstants = {
    "primaryColor": Colors.indigo,
    "accentColor": Colors.indigoAccent,
    "primaryWhite": Colors.white,
  };

  // holds the ThemeData for the application
  final ThemeData _appThemeData = ThemeData(
    primaryColor: _colorConstants["primaryColor"],
    accentColor: _colorConstants["accentColor"],
  );

  /// getter for _colorConstants
  Map<String, Color> get colorConstants => _colorConstants;

  /// getter for _appThemeData
  ThemeData get themeData => _appThemeData;
}
