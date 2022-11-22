import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeRepository {
  String? themeType;
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
}
