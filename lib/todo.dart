import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

enum Field {
  id,
  title,
  description,
  startDate,
  startTime,
  endDate,
  endTime,
  isCompleted,
  instance
}

class Todo {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.isCompleted,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    final List<String> start = json['start'].toString().split(' ');
    final List<String> end = json['end'].toString().split(' ');
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: start[0],
      startTime: start[1],
      endDate: end[0],
      endTime: end[1],
      isCompleted: json['isComleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final String start = "$startDate $startTime";
    final String end = "$endDate $endTime";
    return {
      'id': id,
      'title': title,
      'description': description,
      'start': start,
      'end': end,
      'isCompleted': isCompleted,
    };
  }
}

Future<List<Todo>> getTasks() async {
  final jsonData = await rootBundle.loadString('lib/assets/tasks/tasks.json');
  List<dynamic> jsonList = json.decode(jsonData);
  List<Todo> tasks = jsonList.map((json) => Todo.fromJson(json)).toList();
  return tasks;
}

class TaskValue extends StatefulWidget {
  final int index;
  final Field field;
  final TextStyle textStyle;
  const TaskValue(
      {super.key,
      required this.index,
      this.field = Field.instance,
      this.textStyle = const TextStyle()});

  @override
  State<StatefulWidget> createState() => _GetTasksState();
}

class _GetTasksState extends State<TaskValue> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error : ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No tasks available.');
        } else {
          Todo todo = snapshot.data![widget.index];
          switch (widget.field) {
            case Field.id:
              return Text(todo.id, style: widget.textStyle);
            case Field.title:
              return Text(todo.title, style: widget.textStyle);
            case Field.description:
              return Text(
                todo.description,
                style: widget.textStyle,
                maxLines: 3,
              );
            case Field.startDate:
              return Text(todo.startDate, style: widget.textStyle);
            case Field.startTime:
              return Text(todo.startTime, style: widget.textStyle);
            case Field.endDate:
              return Text(todo.endDate, style: widget.textStyle);
            case Field.endTime:
              return Text(todo.endTime, style: widget.textStyle);
            case Field.isCompleted:
              return Text(todo.isCompleted.toString());
            default:
              return Text(todo.toString());
          }
        }
      },
    );
  }
}
