import 'package:bloc/bloc.dart';
import 'package:fluttertest/home/active_tasks/active_tasks_repository.dart';

part 'active_tasks_state.dart';

class ActiveTasksCubit extends Cubit<ActiveTasksState> {
  //final storage = const FlutterSecureStorage();
  final ActiveTasksRepository repository; // = ActiveTasksRepository();

  ActiveTasksCubit({required this.repository})
      : super(ActiveTasksState(taskList: [], isListLoading: true));

  Future<void> loadTasks() async {
    final tasks = await repository.loadTasks();

    if (tasks != null) {
      emit(ActiveTasksState(taskList: tasks.split('\n'), isListLoading: false));
    } else {
      emit(ActiveTasksState(taskList: [], isListLoading: false));
    }
  }

  Future<void> addTask(String newTask) async {
    final newTaskList = state.taskList;
    newTaskList.add(newTask);

    emit(ActiveTasksState(taskList: state.taskList, isListLoading: true));
    try {
      await repository.saveTasks(taskList: newTaskList);
      emit(ActiveTasksState(taskList: newTaskList, isListLoading: false));
    } catch (e) {
      emit(ActiveTasksState(taskList: state.taskList, isListLoading: false));
    }
  }

  Future<void> removeTask(int index) async {
    final newTaskList = state.taskList;
    newTaskList.removeAt(index);

    emit(ActiveTasksState(taskList: state.taskList, isListLoading: true));
    try {
      await repository.saveTasks(taskList: newTaskList);
      emit(ActiveTasksState(taskList: newTaskList, isListLoading: false));
    } catch (e) {
      emit(ActiveTasksState(taskList: state.taskList, isListLoading: false));
    }
  }
}
