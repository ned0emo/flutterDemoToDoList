import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/register/view/register_form.dart';

import '../../language.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});

  static Route<void> route(){
    return MaterialPageRoute(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appLanguage.register)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<RegisterCubit>(
          create: (_) => RegisterCubit(context.read<AuthenticationRepository>()),
          child: const RegisterForm(),
        ),
      )
    );
  }
}