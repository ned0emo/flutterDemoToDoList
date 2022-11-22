import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/home/view/completed_tasks_tab_view.dart';

import '../active_tasks/active_tasks_cubit.dart';
import 'active_tasks_tab_view.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  Future<void> showAddTaskDialog(BuildContext contextWithActiveTaskCubit) {
    String taskText = '';

    return showDialog<void>(
      context: contextWithActiveTaskCubit,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить задачу'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Введите текст задачи:'),
                TextField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    taskText = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                if (taskText.isNotEmpty) {
                  BlocProvider.of<ActiveTasksCubit>(contextWithActiveTaskCubit)
                      .addTask(taskText);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Список задач'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.read<AppBloc>().changeTheme();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content:
                          Text('Для изменения темы перезагрузите приложение'),
                    ),
                  );
              },
              icon: const Icon(Icons.light_mode),
            ),
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
          bottom: const TabBar(tabs: <Widget>[
            Tab(text: 'В процессе'),
            Tab(text: 'Завершенные'),
          ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            ///Вкладка с активными задачами
            ActiveTasksTabView(),

            ///Вкладка с завершенными задачами
            CompletedTasksTabView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddTaskDialog(context);
          },
          tooltip: 'Добавить задачу',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
