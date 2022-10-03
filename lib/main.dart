import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo TODO List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Список задач'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> taskList = [];
  List<String> completedTaskList = [];

  String taskText = '';
  String localDir = '';

  File? taskFile;
  File? completedTaskFile;

  Future<void> loadTaskLists() async {
    localDir = await _localPath;
    taskFile = File('$localDir/taskData/taskList.txt');
    completedTaskFile = File('$localDir/taskData/completedTaskList.txt');

    if (taskFile != null && (taskFile!.existsSync())) {
      taskList = taskFile!.readAsLinesSync();
    }

    if (completedTaskFile != null && (completedTaskFile!.existsSync())) {
      completedTaskList = completedTaskFile!.readAsLinesSync();
    }

    setState(() {});
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  void writeTaskFile() {
    final taskDataDir = Directory('$localDir/taskData');
    taskDataDir.createSync();

    var writer = taskFile?.openWrite(mode: FileMode.write);

    if (writer == null) {
      Fluttertoast.showToast(
        msg: "Ошибка записи", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // duration
      );

      loadTaskLists();

      return;
    }

    for (String task in taskList) {
      writer.write('$task\n');
    }
    writer.close();

    writer = completedTaskFile?.openWrite(mode: FileMode.write);

    if (writer == null) {
      Fluttertoast.showToast(
        msg: "Ошибка записи", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // duration
      );

      loadTaskLists();

      return;
    }

    for (String task in completedTaskList) {
      writer.write('$task\n');
    }
    writer.close();
  }

  Future<void> showAddTaskDialog() {
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
                  taskList.add(taskText);
                  taskText = '';

                  writeTaskFile();

                  setState(() {});
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
    loadTaskLists();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(tabs: <Widget>[
            Tab(text: 'В процессе'),
            Tab(text: 'Завершенные'),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            taskList.isNotEmpty
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
                                completedTaskList.add(taskList[index]),
                                taskList.removeAt(index),
                                writeTaskFile(),
                                //writeCompletedTaskFile(),
                                setState(() {}),
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
                                taskList.removeAt(index),
                                writeTaskFile(),
                                setState(() {}),
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
                  ),
            completedTaskList.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: completedTaskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Text(
                              completedTaskList[index],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          /**Удалить завершенную задачу*/
                          Expanded(
                            child: TextButton(
                              onPressed: () => {
                                completedTaskList.removeAt(index),
                                writeTaskFile(),
                                setState(() {}),
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
                  ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddTaskDialog,
          tooltip: 'Добавить задачу',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
