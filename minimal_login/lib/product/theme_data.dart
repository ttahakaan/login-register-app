import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
    ));
ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
    ));

class ThemeColorData with ChangeNotifier {
  static late SharedPreferences _sharedPrefObject;
  bool _isLight = false;
  bool get isGreen => _isLight;
  ThemeData get themeColor {
    return _isLight ? lightTheme : darkTheme;
  }

  void toggleTheme() {
    _isLight = !_isLight;
    saveThemeToSharedPref(_isLight);
    notifyListeners();
  }

  Future<void> createSharedPefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPrefObject.setBool("themeData", value);
  }

  void loadThemeFromSharedPref() async {
    // await createSharedPefObject();
    // _isGreen = _sharedPrefObject.getBool("themeData") ?? true;
    if (_sharedPrefObject.getBool("themeData") == null) {
      _isLight = true;
    } else {
      _isLight = _sharedPrefObject.getBool("themeData")!;
    }
  }
}
