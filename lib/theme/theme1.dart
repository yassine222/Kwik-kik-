import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;
  ThemeMode get currentTheme => _currentTheme;

  ThemeSettings(bool isDark) {
    if (isDark) {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
  }
  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_currentTheme == ThemeMode.light) {
      _currentTheme = ThemeMode.dark;
      sharedPreferences.setBool("is_dark", true);
    } else {
      _currentTheme = ThemeMode.light;
      sharedPreferences.setBool("is_dark", false);
    }

    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      canvasColor: Colors.white,
      dividerColor: Colors.white,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.cyan),
      dividerTheme: const DividerThemeData(thickness: 2),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.cyan),
      appBarTheme: const AppBarTheme(
        color: Colors.cyan,
      ),
      primaryColor: Colors.cyan,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusColor: Colors.cyan,
        labelStyle: TextStyle(
          color: Colors.cyan,
        ),
        hoverColor: Colors.cyan,
        hintStyle: TextStyle(color: Colors.cyan),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.cyan),
        headlineSmall: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        titleMedium:
            TextStyle(color: Colors.cyan), // affect drop down list color
        bodyMedium: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(color: Colors.cyan),
      ),
      listTileTheme: const ListTileThemeData(
          iconColor: Colors.white, textColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white, size: 24),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.cyan,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey,
      canvasColor: Colors.grey,
      dividerColor: Colors.white,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.grey),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      listTileTheme: const ListTileThemeData(
          iconColor: Colors.white, textColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white, size: 24),
    );
  }
}
