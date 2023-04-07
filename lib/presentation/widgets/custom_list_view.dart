import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/todo_cubit.dart';
import 'todo_tile.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.yellow[200],
        shadowColor: Colors.yellow[200],
      ),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          log('bloc builder called insiide custom list view');
          return ReorderableListView.builder(
            itemCount: state.taskList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                key: Key('$index'),
                index: index,
              );
            },
            onReorder: ((oldIndex, newIndex) =>
                context.read<TodoCubit>().reorderList(oldIndex, newIndex)),
          );
        },
      ),
    );
  }
}
