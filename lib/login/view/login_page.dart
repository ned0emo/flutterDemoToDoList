import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/bloc/app_bloc.dart';
import '../../language.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLanguage.login),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.read<AppBloc>().changeLanguage();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(appLanguage.changeLanguageNotify),
                  ),
                );
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              context.read<AppBloc>().changeTheme();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content:
                        Text(appLanguage.changeThemeNotify),
                  ),
                );
            },
            icon: const Icon(Icons.light_mode),
          ),
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
