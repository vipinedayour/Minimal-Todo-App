import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_todo_app/presentation/widgets/vibrate_widget.dart';

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
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return ReorderableListView.builder(
            itemCount: state.taskList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                key: Key('$index'),
                index: index,
              );
            },
            onReorder: ((oldIndex, newIndex) {
              context.read<TodoCubit>().reorderList(oldIndex, newIndex);
            }),
            proxyDecorator: (child, index, animation) => Material(
              child: VibrateWidget(
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
