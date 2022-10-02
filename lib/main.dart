import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  String taskText = "";

  Future<void> showAddTaskDialog() async {
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
                          Expanded(
                            flex: 6,
                            child: Text(
                              '${index+1}. ${taskList[index]}',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () => {
                                completedTaskList.add(taskList[index]),
                                taskList.removeAt(index),
                                setState(() {}),
                              },
                              child: const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () => {
                                taskList.removeAt(index),
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
                          Expanded(
                            child: TextButton(
                              onPressed: () => {
                                completedTaskList.removeAt(index),
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
