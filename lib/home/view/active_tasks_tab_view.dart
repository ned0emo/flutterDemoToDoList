import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../active_tasks/active_tasks_cubit.dart';
import '../completed_tasks/completed_tasks_cubit.dart';

class ActiveTasksTabView extends StatelessWidget {
  const ActiveTasksTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveTasksCubit, ActiveTasksState>(
      builder: (context, state) {
        if (state is ActiveTasksError) {
          return const Center(
            child: Text(
              'Ошибка загрузки списка',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is ActiveTasksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ActiveTasksLoaded) {
          if (state.taskList.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    ///текст задачи
                    Expanded(
                      flex: 6,
                      child: Text(
                        '${index + 1}. ${state.taskList[index]}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    /// Пометить задачу завершенной
                    Expanded(
                      child: TextButton(
                        onPressed: () => {
                          BlocProvider.of<CompletedTasksCubit>(context)
                              .addTask(state.taskList[index]),
                          BlocProvider.of<ActiveTasksCubit>(context)
                              .removeTask(index),
                        },
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    ///Удалить задачу
                    Expanded(
                      child: TextButton(
                        onPressed: () => {
                          BlocProvider.of<ActiveTasksCubit>(context)
                              .removeTask(index),
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          }

          return const Center(
            child: Text(
              'Чтобы добавить задачу, нажмите на кнопку \'+\'',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return const Center(
          child: Text(
            'Неизвестная ошибка',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
