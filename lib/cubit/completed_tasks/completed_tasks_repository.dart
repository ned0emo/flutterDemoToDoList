import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CompletedTasksRepository {
  final storage = const FlutterSecureStorage();
  final storageKey = "completedTasks";

  Future<String?> loadTasks() => storage.read(key: storageKey);

  Future<void> saveTasks({required List<String> taskList}) async {
    if (taskList.isEmpty) {
      await storage.delete(key: storageKey);
      return;
    }

    String tasks = taskList[0];
    for (int i = 1; i < taskList.length; i++) {
      tasks += '\n${taskList[i]}';
    }

    await storage.write(key: storageKey, value: tasks);
  }
}
