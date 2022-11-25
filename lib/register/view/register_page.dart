import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/language_bloc/language_cubit.dart';
import 'package:fluttertest/register/view/register_form.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Localizations.override(
            context: context,
            locale: Locale(state.language),
            child: const RegisterPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<RegisterCubit>(
          create: (_) =>
              RegisterCubit(context.read<AuthenticationRepository>()),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
