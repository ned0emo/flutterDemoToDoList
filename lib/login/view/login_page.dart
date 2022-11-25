import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertest/app/language_bloc/language_cubit.dart';
import '../../app/theme_bloc/theme_cubit.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => MaterialPage<void>(
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Localizations.override(
              context: context,
              locale: Locale(state.language),
              child: const LoginPage(),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                BlocProvider.of<LanguageCubit>(context).changeLanguage(),
            icon: const Icon(Icons.language),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme();
              },
              icon:
                  Icon(state is ThemeDark ? Icons.light_mode : Icons.dark_mode),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
