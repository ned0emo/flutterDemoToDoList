part of 'active_tasks_cubit.dart';

class ActiveTasksState {
  final List<String> taskList;
  final bool isListLoading;

  ActiveTasksState({
    required this.taskList,
    required this.isListLoading,
  });
}
