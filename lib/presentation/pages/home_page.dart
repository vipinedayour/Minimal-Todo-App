import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minimal_todo_app/cubit/todo_cubit.dart';
import 'package:minimal_todo_app/presentation/widgets/add_new_task.dart';
import '../widgets/custom_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('todoBox');
  @override
  void initState() {
    super.initState();
    //if its not the first time running the app
    if (myBox.get('TodoList') != null) {
      context.read<TodoCubit>().loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        elevation: 0,
      ),
      body: const CustomListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          showDialog(
            context: context,
            builder: (context) {
              return AddNewTask();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
