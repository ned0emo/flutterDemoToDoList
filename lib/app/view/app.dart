import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/app/language_bloc/language_cubit.dart';
import 'package:fluttertest/app/language_bloc/language_repository.dart';
import 'package:fluttertest/app/theme_bloc/theme_cubit.dart';
import 'package:fluttertest/app/theme_bloc/theme_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.themeRepository,
    required this.languageRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final ThemeRepository themeRepository;
  final LanguageRepository languageRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => authenticationRepository),
        RepositoryProvider(create: (context) => themeRepository),
        RepositoryProvider(create: (context) => languageRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AppBloc(authenticationRepository: authenticationRepository)),
          BlocProvider(
              create: (context) =>
                  ThemeCubit(themeRepository: themeRepository)..loadTheme()),
          BlocProvider(
              create: (context) =>
                  LanguageCubit(languageRepository: languageRepository)
                    ..loadLanguage())
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('ru'),
          Locale('en'),
        ],
        theme: state.theme,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      );
    });
  }
}
