import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeRepository{
  final secureStorage = const FlutterSecureStorage();
  String? themeType;

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
}