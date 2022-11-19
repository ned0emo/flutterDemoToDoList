part of 'completed_tasks_cubit.dart';

abstract class CompletedTasksState {}

class CompletedTasksLoading extends CompletedTasksState {}

class CompletedTasksLoaded extends CompletedTasksState {
  final List<String> completedTaskList;

  CompletedTasksLoaded({
    required this.completedTaskList,
  });
}

class CompletedTasksError extends CompletedTasksState {}
