import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:university_chat_app/main.dart';

class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    // ThemeMode.system
    bool? isDarkTheme =
        Hive.box(darkModeBox).get('darkMode', defaultValue: null);
    if (isDarkTheme == null) return ThemeMode.system;
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(bool isDarkTheme) async {
    Hive.box(darkModeBox).put('darkMode', isDarkTheme);
  }
}
