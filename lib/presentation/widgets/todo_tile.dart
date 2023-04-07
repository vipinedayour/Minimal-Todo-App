import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:minimal_todo_app/cubit/todo_cubit.dart';

class TodoTile extends StatelessWidget {
  final int index;

  const TodoTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red.shade300,
              icon: Icons.delete,
              onPressed: (context) {
                context.read<TodoCubit>().removeTask(index);
              },
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.yellow),
          child: Row(
            children: [
              Checkbox(
                value: context.read<TodoCubit>().state.taskList[index][1],
                onChanged: ((value) {
                  context.read<TodoCubit>().toggleCheckBox(index);
                  log('check box clicked');
                }),
                checkColor: Colors.black,
                activeColor: Colors.amber,
              ),
              Expanded(
                child: Text(
                  context.read<TodoCubit>().state.taskList[index][0],
                  style: TextStyle(
                      fontSize: 18,
                      decoration:
                          context.read<TodoCubit>().state.taskList[index][1]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
