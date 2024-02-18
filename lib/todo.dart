import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

// enum Field {
//   id,
//   title,
//   description,
//   startDate,
//   startTime,
//   endDate,
//   endTime,
//   isCompleted,
//   instance
// }

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime start;
  //final String startDate;
  //final String startTime;
  final DateTime end;
  //final String endDate;
  //final String endTime;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.start,
    //required this.startDate,
    //required this.startTime,
    required this.end,
    //required this.endDate,
    //required this.endTime,
    required this.isCompleted,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    //final List<String> start = json['start'].toString().split(' ');
    //final List<String> end = json['end'].toString().split(' ');
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      start: DateTime.parse(json['start']),
      //startDate: start[0],
      //startTime: start[1],
      end: DateTime.parse(json['end']),
      //endDate: end[0],
      //endTime: end[1],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start': start.toString(),
      'end': end.toString(),
      'isCompleted': isCompleted,
    };
  }
}

Future<List<Todo>> getTasks() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/tasks.json");
    if (!await file.exists()) {
      await file.create();
      debugPrint("File created at: ${file.path}");
      return [];
    }
    final jsonData = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<Todo> tasks = jsonList.map((json) => Todo.fromJson(json)).toList();
    return tasks;
  } catch (e) {
    debugPrint('Error fetching tasks: $e');
    return [];
  }
}

Future<void> addTask(Todo task) async {
  try {
    List<Todo> existingTask = await getTasks();
    existingTask.add(task);
    List<Map<String, dynamic>> updated =
        existingTask.map((todo) => todo.toJson()).toList();
    final encodedTask = json.encode(updated);
    final directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/tasks.json");
    file.writeAsString(encodedTask);
  } catch (e) {
    debugPrint("Error while adding task: $e");
  }
}

// class TaskValue extends StatefulWidget {
//   final int index;
//   final Field field;
//   final TextStyle textStyle;
//   final bool textWrap;
//   final int maxLines;
//   const TaskValue({
//     super.key,
//     required this.index,
//     this.field = Field.instance,
//     this.textStyle = const TextStyle(),
//     this.textWrap = true,
//     this.maxLines = 1,
//   });

//   @override
//   State<StatefulWidget> createState() => _GetTasksState();
// }

// class _GetTasksState extends State<TaskValue> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Todo>>(
//       future: getTasks(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text("Error : ${snapshot.error}");
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Text('No tasks available.');
//         } else {
//           Todo todo = snapshot.data![widget.index];
//           switch (widget.field) {
//             case Field.id:
//               return Text(todo.id, style: widget.textStyle);
//             case Field.title:
//               return Text(todo.title, style: widget.textStyle);
//             case Field.description:
//               return Text(
//                 todo.description,
//                 style: widget.textStyle,
//                 maxLines: widget.maxLines,
//                 softWrap: widget.textWrap,
//                 overflow: widget.textWrap
//                     ? null
//                     : TextOverflow
//                         .ellipsis, //Check textWrap Since overflow and softWrap cannot exist together
//               );
//             case Field.startDate:
//               return Text(todo.startDate, style: widget.textStyle);
//             case Field.startTime:
//               return Text(todo.startTime, style: widget.textStyle);
//             case Field.endDate:
//               return Text(todo.endDate, style: widget.textStyle);
//             case Field.endTime:
//               return Text(todo.endTime, style: widget.textStyle);
//             case Field.isCompleted:
//               return Text(todo.isCompleted.toString());
//             default:
//               return Text(todo.toString());
//           }
//         }
//       },
//     );
//   }
// }
