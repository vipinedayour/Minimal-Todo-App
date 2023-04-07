import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/todo_cubit.dart';

class AddNewTask extends StatelessWidget {
  final textController = TextEditingController();

  AddNewTask({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add New Task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //add button
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    if (textController.text != '') {
                      context.read<TodoCubit>().addTask(textController.text);
                    }

                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
                //cancel button
                MaterialButton(
                  color: Colors.yellow[300],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
