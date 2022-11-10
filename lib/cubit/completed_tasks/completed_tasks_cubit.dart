import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertest/cubit/completed_tasks/completed_tasks_repository.dart';

part 'completed_tasks_state.dart';

class CompletedTasksCubit extends Cubit<CompletedTasksState> {
  final storage = const FlutterSecureStorage();
  final CompletedTasksRepository repository; // = CompletedTasksRepository();

  CompletedTasksCubit({required this.repository})
      : super(CompletedTasksState(completedTaskList: [], isLoading: true));

  Future<void> loadTasks() async {
    final tasks = await repository.loadTasks();

    if (tasks != null) {
      emit(CompletedTasksState(
          completedTaskList: tasks.split('\n'), isLoading: false));
    } else {
      emit(CompletedTasksState(completedTaskList: [], isLoading: false));
    }
  }

  Future<void> addTask(String newTask) async {
    final newTaskList = state.completedTaskList;
    newTaskList.add(newTask);

    await repository.saveTasks(taskList: newTaskList);
    emit(CompletedTasksState(completedTaskList: newTaskList, isLoading: false));
  }

  Future<void> removeTask(int index) async {
    final newTaskList = state.completedTaskList;
    newTaskList.removeAt(index);

    await repository.saveTasks(taskList: newTaskList);
    emit(CompletedTasksState(completedTaskList: newTaskList, isLoading: false));
  }
}
