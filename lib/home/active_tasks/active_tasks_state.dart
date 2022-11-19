part of 'active_tasks_cubit.dart';

abstract class ActiveTasksState {}

class ActiveTasksLoading extends ActiveTasksState {}

class ActiveTasksLoaded extends ActiveTasksState {
  final List<String> taskList;

  ActiveTasksLoaded({
    required this.taskList,
  });
}

class ActiveTasksError extends ActiveTasksState {}
