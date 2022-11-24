import 'package:bloc/bloc.dart';

import 'language_repository.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageRepository languageRepository;
  LanguageCubit({required this.languageRepository}) : super(LanguageState(language: 'ru'));

  Future<void> changeLanguage() async {
    await languageRepository.saveLanguage();
    emit(LanguageState(language: languageRepository.languageType));
  }

  void loadLanguage() {
    emit(LanguageState(language: languageRepository.languageType));
  }
}
