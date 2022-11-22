import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/app/bloc/theme_repository.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required AuthenticationRepository authenticationRepository,
      required this.themeRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => _authenticationRepository),
        RepositoryProvider(create: (context) => themeRepository),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
          themeRepository: themeRepository,
        )..loadTheme(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BlocProvider.of<AppBloc>(context).theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
