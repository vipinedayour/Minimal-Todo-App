import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  final todoBox = Hive.box('todoBox');

  void loadData() {
    //load data from hive
    var tempList = todoBox.get('TodoList');
    emit(TodoState(taskList: tempList));
  }

  void toggleCheckBox(int index) {
    //NEVER MUTATE THE EXISTING STATE
    var tempList = state.taskList;
    tempList[index][1] = !state.taskList[index][1];
    //👇this is mutating the current state
    //state.taskList[index][1] = value;
    emit(TodoState(taskList: tempList));
    //update the hive database
    updateDatabase(state.taskList);
  }

  void addTask(String taskName) {
    var tempList = state.taskList;
    tempList.add([taskName, false]);
    emit(TodoState(taskList: tempList));
    updateDatabase(state.taskList);
  }

  void removeTask(int index) {
    var tempList = state.taskList;
    tempList.removeAt(index);
    emit(TodoState(taskList: tempList));
    //update the hive database
    updateDatabase(state.taskList);
  }

  void updateDatabase(List data) {
    // log('update database called');
    todoBox.put('TodoList', data);
    // log(todoBox.get('TodoList').toString());
  }

  void reorderList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var tempList = state.taskList;
    final item = tempList.removeAt(oldIndex);
    tempList.insert(newIndex, item);
    emit(TodoState(taskList: tempList));
    updateDatabase(state.taskList);
  }

  // @override
  // TodoState? fromJson(Map<String, dynamic> json) {
  //   return TodoState.fromMap(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(TodoState state) {
  //   return state.toMap();
  // }
}
