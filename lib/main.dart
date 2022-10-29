import 'package:flutter/material.dart';
import 'package:fluttertest/cubit/active_tasks/active_tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/completed_tasks/completed_tasks_cubit.dart';
import 'package:external_path/external_path.dart';

Future<void> main() async {
  //if(await _requestPermission(Permission.storage))
  /*String path=await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActiveTasksCubit(),
        ),
        BlocProvider(
          create: (context) => CompletedTasksCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo TODO List',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  Future<void> showAddTaskDialog(BuildContext context) {
    String taskText = '';
    return showDialog<void>(
      context: context,
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
                taskText = '';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                if (taskText.isNotEmpty) {
                  BlocProvider.of<ActiveTasksCubit>(context).addTask(taskText);
                  taskText = '';
                  //writeTaskFile();
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
    //loadTaskLists();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Список задач'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(text: 'В процессе'),
            Tab(text: 'Завершенные'),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocBuilder<ActiveTasksCubit, ActiveTasksState>(
              builder: (context, state) {
                List<String> taskList = BlocProvider.of<ActiveTasksCubit>(context)
                    .state.taskList;

                return taskList.isNotEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: taskList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              /**Текст задачи*/
                              Expanded(
                                flex: 6,
                                child: Text(
                                  '${index + 1}. ${taskList[index]}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              /**Пометить задачу завершенной*/
                              Expanded(
                                child: TextButton(
                                  onPressed: () => {
                                    BlocProvider.of<CompletedTasksCubit>(
                                            context)
                                        .addTask(
                                            BlocProvider.of<ActiveTasksCubit>(
                                                    context)
                                                .state
                                                .taskList[index]),
                                    //completedTaskList.add(taskList[index]),
                                    BlocProvider.of<ActiveTasksCubit>(context)
                                        .removeTask(index),
                                    //taskList.removeAt(index),
                                    //writeTaskFile(),
                                    //writeCompletedTaskFile(),
                                    //setState(() {}),
                                  },
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              /**Удалить задачу*/
                              Expanded(
                                child: TextButton(
                                  onPressed: () => {
                                    BlocProvider.of<ActiveTasksCubit>(context)
                                        .removeTask(index),
                                    //taskList.removeAt(index),
                                    //writeTaskFile(),
                                    //setState(() {}),
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
                      )
                    : const Center(
                        child: Text(
                          'Чтобы добавить задачу, нажмите на кнопку \'+\'',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
              },
            ),
            BlocBuilder<CompletedTasksCubit, CompletedTasksState>(
              builder: (context, state) {
                return BlocProvider.of<CompletedTasksCubit>(context)
                        .state
                        .completedTaskList
                        .isNotEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: BlocProvider.of<CompletedTasksCubit>(context)
                            .state
                            .completedTaskList
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  BlocProvider.of<CompletedTasksCubit>(context)
                                      .state
                                      .completedTaskList[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              /**Удалить завершенную задачу*/
                              Expanded(
                                child: TextButton(
                                  onPressed: () => {
                                    BlocProvider.of<CompletedTasksCubit>(
                                            context)
                                        .removeTask(index),
                                    //completedTaskList.removeAt(index),
                                    //writeTaskFile(),
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
                      )
                    : const Center(
                        child: Text(
                          'Нет завершенных задач',
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
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

