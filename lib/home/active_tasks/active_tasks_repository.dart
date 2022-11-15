import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActiveTasksRepository {
  final storage = const FlutterSecureStorage();
  final storageKey = "activeTasks";

  Future<void> fireStoreInit() async{
    final fireStorage = FirebaseFirestore.instance;
    int k = 0;
  }

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
