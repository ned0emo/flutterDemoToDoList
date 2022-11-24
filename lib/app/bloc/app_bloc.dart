import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;
  late final ThemeData theme;

  AppBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }
/*
  Future<void> changeTheme() async {
    await languageThemeRepository.saveTheme();
    //loadTheme();
  }

  void loadTheme() {
    if (languageThemeRepository.themeType == 'light') {
      theme = ThemeData(
        primaryColorDark: Colors.deepPurple,
        primaryColorLight: Colors.deepPurpleAccent,
        primaryColor: Colors.pink,
        colorScheme: const ColorScheme.light(secondary: Colors.pinkAccent),
        scaffoldBackgroundColor: Colors.white,
      );
    } else {
      theme = ThemeData(
        primaryColorDark: Colors.deepPurple,
        primaryColorLight: Colors.deepPurpleAccent,
        primaryColor: Colors.purple,
        colorScheme: const ColorScheme.dark(secondary: Colors.purpleAccent),
        scaffoldBackgroundColor: Colors.black54,
      );
    }
  }

  Future<void> changeLanguage() async {
    await languageThemeRepository.saveLanguage();
  }

  void loadLanguage() {
    if (languageThemeRepository.languageType == 'ru') {
      appLanguage = AppLanguage(language: 'ru');
    } else {
      appLanguage = AppLanguage(language: 'en');
    }
  }
*/
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
