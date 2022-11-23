import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentication_repository/authentication_repository.dart';

import 'app/bloc/lang_theme_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  final languageThemeRepository = LanguageThemeRepository();
  await languageThemeRepository.loadTheme();
  await languageThemeRepository.loadLanguage();

  runApp(App(
    authenticationRepository: authenticationRepository,
    languageThemeRepository: languageThemeRepository,
  ));
}
