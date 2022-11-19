import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/app.dart';

import '../active_tasks/active_tasks_cubit.dart';
import '../completed_tasks/completed_tasks_cubit.dart';

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
        body: TabBarView(
          children: <Widget>[
            /**
             * Вкладка с активными задачами
             */
            BlocBuilder<ActiveTasksCubit, ActiveTasksState>(
              builder: (context, state) {
                if (state is ActiveTasksError) {
                  return const Center(
                    child: Text(
                      'Ошибка загрузки списка',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state is ActiveTasksLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ActiveTasksLoaded) {
                  if (state.taskList.isNotEmpty) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.taskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: <Widget>[
                            /**
                             * Текст задачи
                             */
                            Expanded(
                              flex: 6,
                              child: Text(
                                '${index + 1}. ${state.taskList[index]}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            /**
                             * Пометить задачу завершенной
                             */
                            Expanded(
                              child: TextButton(
                                onPressed: () => {
                                  BlocProvider.of<CompletedTasksCubit>(context)
                                      .addTask(state.taskList[index]),
                                  BlocProvider.of<ActiveTasksCubit>(context)
                                      .removeTask(index),
                                },
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            /**
                             * Удалить задачу
                             */
                            Expanded(
                              child: TextButton(
                                onPressed: () => {
                                  BlocProvider.of<ActiveTasksCubit>(context)
                                      .removeTask(index),
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    );
                  }

                  return const Center(
                    child: Text(
                      'Чтобы добавить задачу, нажмите на кнопку \'+\'',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return const Center(
                  child: Text(
                    'Неизвестная ошибка',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            /**
             * вкладка с завершенными задачами
             */
            BlocBuilder<CompletedTasksCubit, CompletedTasksState>(
              builder: (context, state) {
                if (state is CompletedTasksError) {
                  return const Center(
                    child: Text(
                      'Ошибка загрузки списка',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state is CompletedTasksLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CompletedTasksLoaded) {
                  if (state.completedTaskList.isNotEmpty) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.completedTaskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              flex: 6,
                              child: Text(
                                state.completedTaskList[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            /**
                             * Удалить завершенную задачу
                             */
                            Expanded(
                              child: TextButton(
                                onPressed: () => {
                                  BlocProvider.of<CompletedTasksCubit>(context)
                                      .removeTask(index),
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    );
                  }

                  return const Center(
                    child: Text(
                      'Нет завершенных задач',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return const Center(
                  child: Text(
                    'Неизвестная ошибка',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
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
