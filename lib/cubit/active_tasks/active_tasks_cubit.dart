import 'package:bloc/bloc.dart';
import 'package:fluttertest/cubit/completed_tasks/completed_tasks_cubit.dart';
import 'package:meta/meta.dart';

part 'active_tasks_state.dart';

class ActiveTasksCubit extends Cubit<ActiveTasksState> {
  ActiveTasksCubit() : super(ActiveTasksState(taskList: ['meow', 'wow', 'heh', 'keks']));

  void addTask(String newTask){
    List<String> newTaskList = state.taskList;
    newTaskList.add(newTask);

    emit(ActiveTasksState(taskList: newTaskList));
  }

  void removeTask(int index){
    List<String> newTaskList = state.taskList;
    newTaskList.removeAt(index);
    emit(ActiveTasksState(taskList: newTaskList));
  }
}
