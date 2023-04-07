// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_cubit.dart';

class TodoState {
  final List taskList;

  TodoState({required this.taskList});

  TodoState copyWith({
    List? taskList,
  }) {
    return TodoState(
      taskList: taskList ?? this.taskList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskList': taskList,
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
        taskList: List.from(
      (map['taskList'] as List),
    ));
  }

  String toJson() => json.encode(toMap());

  factory TodoState.fromJson(String source) =>
      TodoState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TodoInitial extends TodoState {
  TodoInitial()
      : super(taskList: [
          ['Tap + to add new task', false],
          ['Tap the check box to finish a task', true],
          ['Slide left to delete task', false]
        ]);
}
