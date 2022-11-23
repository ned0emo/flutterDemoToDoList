import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertest/language.dart';

class LanguageThemeRepository {
  String? themeType;
  String? languageType;
  final secureStorage = const FlutterSecureStorage();

  Future<void> loadTheme() async {
    themeType = await secureStorage.read(key: 'theme');
  }

  Future<void> saveTheme() async {
    if (themeType == 'light') {
      await secureStorage.write(key: 'theme', value: 'dark');
      themeType = 'dark';
    } else {
      await secureStorage.write(key: 'theme', value: 'light');
      themeType = 'light';
    }
  }

  Future<void> loadLanguage() async {
    languageType = await secureStorage.read(key: 'lang');
    if (languageType == 'ru') {
      appLanguage = AppLanguage(language: 'ru');
    } else {
      appLanguage = AppLanguage(language: 'en');
    }
  }

  Future<void> saveLanguage() async {
    if (languageType == 'en') {
      await secureStorage.write(key: 'lang', value: 'ru');
      languageType = 'ru';
    } else {
      await secureStorage.write(key: 'lang', value: 'en');
      languageType = 'en';
    }
  }
}
