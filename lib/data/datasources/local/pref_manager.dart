import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;

  const ActiveTheme(this.mode);
}

class PrefManager {
  String kLanguage = "language";
  String kLocale = "locale";
  String kTheme = "theme";

  /// Light, Dark ,System

  SharedPreferences preferences;

  PrefManager(this.preferences);

  /// Default locale set to English
  set locale(String? value) => preferences.setString(kLocale, value ?? "en");

  String get locale => preferences.getString(kLocale) ?? "en";

  /// Default locale set to English
  set theme(String? value) =>
      preferences.setString(kTheme, value ?? describeEnum(ActiveTheme.system));

  String get theme =>
      preferences.getString(kTheme) ?? describeEnum(ActiveTheme.system);

  void logout() => preferences.clear();
}
