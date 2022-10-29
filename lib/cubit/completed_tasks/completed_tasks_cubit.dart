import 'package:bloc/bloc.dart';

part 'completed_tasks_state.dart';

class CompletedTasksCubit extends Cubit<CompletedTasksState> {
  CompletedTasksCubit() : super(CompletedTasksState(completedTaskList: ['meowel', 'wowel']));

  void removeTask(int index){
    List<String> newTaskList = state.completedTaskList;
    newTaskList.removeAt(index);
    emit(CompletedTasksState(completedTaskList: newTaskList));
  }

  void addTask(String newTask){
    List<String> newTaskList = state.completedTaskList;
    newTaskList.add(newTask);
    emit(CompletedTasksState(completedTaskList: newTaskList));
  }
}
