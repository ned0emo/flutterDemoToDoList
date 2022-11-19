import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';

class CompletedTasksRepository {
  final fireStorage = FirebaseStorage.instance.ref();
  final String userId;
  late final Reference completedTasksFile;

  CompletedTasksRepository({required this.userId});

  Future<String?> loadTasks() async {
    completedTasksFile = fireStorage.child('users/$userId/completed.txt');

    try {
      final completedTasksData = await completedTasksFile.getData();

      String? completedTasksText;
      if (completedTasksData != null) {
        completedTasksText = String.fromCharCodes(completedTasksData);
      }
      return completedTasksText;
    } catch (e) {
      return '';
    }
  }

  Future<void> saveTasks({required List<String> taskList}) async {
    if (taskList.isEmpty) {
      await completedTasksFile.delete();
      return;
    }

    String tasks = taskList[0];
    for (int i = 1; i < taskList.length; i++) {
      tasks += '\n${taskList[i]}';
    }

    await completedTasksFile.putString(tasks);
  }
}
