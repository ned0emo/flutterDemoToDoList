import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../language.dart';
import '../completed_tasks/completed_tasks_cubit.dart';

class CompletedTasksTabView extends StatelessWidget{
  const CompletedTasksTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedTasksCubit, CompletedTasksState>(
      builder: (context, state) {
        if (state is CompletedTasksError) {
          return Center(
            child: Text(
              appLanguage.listLoadError,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is CompletedTasksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CompletedTasksLoaded) {
          if (state.completedTaskList.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.completedTaskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Text(
                        state.completedTaskList[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ///Удалить завершенную задачу
                    Expanded(
                      child: TextButton(
                        onPressed: () => {
                          BlocProvider.of<CompletedTasksCubit>(context)
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

          return Center(
            child: Text(
              appLanguage.completedTaskIsEmpty,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Center(
          child: Text(
            appLanguage.unknownError,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

}