import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LanguageRepository{
  final secureStorage = const FlutterSecureStorage();
  late String languageType;

  Future<void> loadLanguage() async {
    languageType = await secureStorage.read(key: 'lang') ?? 'ru';
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