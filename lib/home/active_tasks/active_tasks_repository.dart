import 'package:firebase_storage/firebase_storage.dart';

class ActiveTasksRepository {
  final fireStorage = FirebaseStorage.instance.ref();
  final String userId;
  late final Reference activeTasksFile;

  ActiveTasksRepository({required this.userId});

  Future<String?> loadTasks() async {
    activeTasksFile = fireStorage.child('users/$userId/active.txt');

    try {
      final activeTasksData = await activeTasksFile.getData();

      String? activeTasksText;
      if (activeTasksData != null) {
        activeTasksText = String.fromCharCodes(activeTasksData);
      }
      return activeTasksText;
    } catch (e) {
      return '';
    }
  }

  Future<void> saveTasks({required List<String> taskList}) async {
    if (taskList.isEmpty) {
      await activeTasksFile.delete();
      return;
    }

    String tasks = taskList[0];
    for (int i = 1; i < taskList.length; i++) {
      tasks += '\n${taskList[i]}';
    }
    await activeTasksFile.putString(tasks);
  }
}
