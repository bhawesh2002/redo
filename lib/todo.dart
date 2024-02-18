import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class Todo {
  final String title;
  final String description;
  final DateTime start;
  final DateTime end;
  final bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.isCompleted,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      description: json['description'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
    List<Todo> sorted = sortTasks(existingTask);
    List<Map<String, dynamic>> updated =
        sorted.map((todo) => todo.toJson()).toList();
    final encodedTask = json.encode(updated);
    final directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/tasks.json");
    file.writeAsString(encodedTask);
  } catch (e) {
    debugPrint("Error while adding task: $e");
  }
}

List<Todo> sortTasks(List<Todo> tasks) {
  List<Todo> sortedTasks = List.from(tasks);

  sortedTasks.sort((a, b) => a.start.compareTo(b.start));

  return sortedTasks;
}
