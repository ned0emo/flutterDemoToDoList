import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/home/view/home_view.dart';

import '../active_tasks/active_tasks_cubit.dart';
import '../active_tasks/active_tasks_repository.dart';
import '../completed_tasks/completed_tasks_cubit.dart';
import '../completed_tasks/completed_tasks_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userId});

  final String userId;
  static Page<void> page(String id) => MaterialPage<void>(child: HomePage(userId: id));

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ActiveTasksRepository>(
          create: (context) => ActiveTasksRepository(userId: userId),
        ),
        RepositoryProvider<CompletedTasksRepository>(
          create: (context) => CompletedTasksRepository(userId: userId),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ActiveTasksCubit(
                repository: context.read<ActiveTasksRepository>())
              ..loadTasks(),
          ),
          BlocProvider(
            create: (context) => CompletedTasksCubit(
                repository: context.read<CompletedTasksRepository>())
              ..loadTasks(),
          ),
        ],
        child: const MyHomeView(),
      ),
    );
  }
}
