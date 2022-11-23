import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/home/view/completed_tasks_tab_view.dart';

import '../../app/bloc/lang_theme_repository.dart';
import '../../language.dart';
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
          title: Text(appLanguage.addTask),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(appLanguage.inputTaskText),
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
              child: Text(appLanguage.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(appLanguage.add),
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
          title: Text(appLanguage.toDoList),
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
                      content: Text(appLanguage.changeThemeNotify),
                    ),
                  );
              },
              icon: Icon(RepositoryProvider.of<LanguageThemeRepository>(context)
                          .themeType ==
                      'dark'
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(text: appLanguage.inProcess),
            Tab(text: appLanguage.completed),
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
          tooltip: appLanguage.addTask,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
