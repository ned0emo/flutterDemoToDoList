import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertest/cubit/active_tasks/active_tasks_repository.dart';

part 'active_tasks_state.dart';

class ActiveTasksCubit extends Cubit<ActiveTasksState> {
  ActiveTasksCubit() : super(ActiveTasksState(taskList: [], isLoading: true));
  final storage = const FlutterSecureStorage();
  final repository = ActiveTasksRepository();

  Future<void> loadTasks() async {
    final tasks = await repository.loadTasks();

    if (tasks != null) {
      emit(ActiveTasksState(taskList: tasks.split('\n'), isLoading: false));
    }
    else{
      emit(ActiveTasksState(taskList: [], isLoading: false));
    }
  }

  Future<void> addTask(String newTask) async {
    final newTaskList = state.taskList;
    newTaskList.add(newTask);

    await repository.saveTasks(taskList: newTaskList);
    emit(ActiveTasksState(taskList: newTaskList, isLoading: false));
  }

  Future<void> removeTask(int index) async {
    final newTaskList = state.taskList;
    newTaskList.removeAt(index);

    await repository.saveTasks(taskList: newTaskList);
    emit(ActiveTasksState(taskList: newTaskList, isLoading: false));
  }
}
