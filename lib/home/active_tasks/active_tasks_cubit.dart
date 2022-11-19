import 'package:bloc/bloc.dart';
import 'package:fluttertest/home/active_tasks/active_tasks_repository.dart';

part 'active_tasks_state.dart';

class ActiveTasksCubit extends Cubit<ActiveTasksState> {
  final ActiveTasksRepository repository;

  ActiveTasksCubit({required this.repository})
      : super(ActiveTasksLoading());

  Future<void> loadTasks() async {
    final tasks = await repository.loadTasks();

    if (tasks != null) {
      emit(ActiveTasksLoaded(taskList: tasks.isNotEmpty ? tasks.split('\n') : []));
    } else {
      emit(ActiveTasksError());
    }
  }

  Future<void> addTask(String newTask) async {
    ActiveTasksState state = this.state;
    if(state is ActiveTasksError){
      emit(ActiveTasksLoading());
      final tasks = await repository.loadTasks();

      if (tasks != null) {
        emit(ActiveTasksLoaded(taskList: tasks.split('\n')));
      } else {
        emit(ActiveTasksError());
        return;
      }
    }

    state = this.state;
    if(state is ActiveTasksLoaded){
      final newTaskList = state.taskList;
      newTaskList.add(newTask);

      emit(ActiveTasksLoading());
      try {
        await repository.saveTasks(taskList: newTaskList);
        emit(ActiveTasksLoaded(taskList: newTaskList));
      } catch (e) {
        emit(ActiveTasksError());
      }
    }
  }

  Future<void> removeTask(int index) async {
    final state = this.state;

    if(state is ActiveTasksLoaded){
      final newTaskList = state.taskList;
      newTaskList.removeAt(index);

      emit(ActiveTasksLoading());
      try {
        await repository.saveTasks(taskList: newTaskList);
        emit(ActiveTasksLoaded(taskList: newTaskList));
      } catch (e) {
        emit(ActiveTasksError());
      }
    }
  }
}
