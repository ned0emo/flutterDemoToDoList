import 'package:bloc/bloc.dart';
import 'package:fluttertest/home/active_tasks/active_tasks_cubit.dart';
import 'package:fluttertest/home/completed_tasks/completed_tasks_repository.dart';

part 'completed_tasks_state.dart';

class CompletedTasksCubit extends Cubit<CompletedTasksState> {
  final CompletedTasksRepository repository;

  CompletedTasksCubit({required this.repository})
      : super(CompletedTasksLoading());

  Future<void> loadTasks() async {
    final tasks = await repository.loadTasks();

    if (tasks != null) {
      emit(CompletedTasksLoaded(
          completedTaskList: tasks.isNotEmpty ? tasks.split('\n') : []));
    } else {
      emit(CompletedTasksError());
    }
  }

  Future<void> addTask(String newTask) async {
    CompletedTasksState state = this.state;

    if (state is CompletedTasksError) {
      emit(CompletedTasksLoading());
      final tasks = await repository.loadTasks();

      if (tasks != null) {
        emit(CompletedTasksLoaded(completedTaskList: tasks.split('\n')));
      } else {
        emit(CompletedTasksError());
        return;
      }
    }

    state = this.state;
    if (state is CompletedTasksLoaded) {
      final newTaskList = state.completedTaskList;
      newTaskList.add(newTask);

      emit(CompletedTasksLoading());
      try {
        await repository.saveTasks(taskList: newTaskList);
        emit(CompletedTasksLoaded(completedTaskList: newTaskList));
      } catch (e) {
        emit(CompletedTasksError());
      }
    }
  }

  Future<void> removeTask(int index) async {
    final state = this.state;

    if (state is CompletedTasksLoaded) {
      final newTaskList = state.completedTaskList;
      newTaskList.removeAt(index);

      emit(CompletedTasksLoading());
      try {
        await repository.saveTasks(taskList: newTaskList);
        emit(CompletedTasksLoaded(completedTaskList: newTaskList));
      } catch (e) {
        emit(CompletedTasksError());
      }
    }
  }
}
