import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/app/theme_bloc/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository themeRepository;

  ThemeCubit({required this.themeRepository}) : super(ThemeLight());

  Future<void> changeTheme() async {
    await themeRepository.saveTheme();

    if (state is ThemeLight) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }

  void loadTheme() {
    if (themeRepository.themeType == 'light') {
      emit(ThemeLight());
    } else {
      emit(ThemeDark());
    }
  }
}
