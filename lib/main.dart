import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/theme_bloc/theme_repository.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentication_repository/authentication_repository.dart';

import 'app/language_bloc/language_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  final themeRepository = ThemeRepository();
  await themeRepository.loadTheme();

  final languageRepository = LanguageRepository();
  await languageRepository.loadLanguage();

  runApp(App(
    authenticationRepository: authenticationRepository,
    themeRepository: themeRepository,
    languageRepository: languageRepository,
  ));
}
