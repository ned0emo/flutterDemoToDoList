import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/app/language_bloc/language_cubit.dart';
import 'package:fluttertest/app/theme_bloc/theme_cubit.dart';
import 'package:fluttertest/home/view/completed_tasks_tab_view.dart';

import '../active_tasks/active_tasks_cubit.dart';
import 'active_tasks_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  Future<void> showAddTaskDialog(BuildContext mainContext) {
    String taskText = '';

    return showDialog<void>(
      context: mainContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Localizations.override(
                context: context,
                locale: Locale(state.language),
                child: AlertDialog(
                  title: Text(AppLocalizations.of(mainContext)!.addTask),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(AppLocalizations.of(mainContext)!.inputTaskText),
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
                      child: Text(AppLocalizations.of(mainContext)!.cancel),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(AppLocalizations.of(mainContext)!.add),
                      onPressed: () {
                        if (taskText.isNotEmpty) {
                          BlocProvider.of<ActiveTasksCubit>(mainContext)
                              .addTask(taskText);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ));
          },
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
          title: Text(AppLocalizations.of(context)!.toDoList),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.read<LanguageCubit>().changeLanguage();
              },
              icon: const Icon(Icons.language),
            ),
            BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().changeTheme();
                },
                icon: Icon(
                    state is ThemeDark ? Icons.light_mode : Icons.dark_mode),
              );
            }),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(text: AppLocalizations.of(context)!.inProcess),
            Tab(text: AppLocalizations.of(context)!.completed),
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
          tooltip: AppLocalizations.of(context)!.addTask,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
