import 'package:flutter/material.dart';
import 'package:fluttertest/app/bloc_observer.dart';
import 'package:fluttertest/home/active_tasks/active_tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/home/active_tasks/active_tasks_repository.dart';
import 'package:fluttertest/home/completed_tasks/completed_tasks_repository.dart';
import 'app/app.dart';
import 'home/completed_tasks/completed_tasks_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentication_repository/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}