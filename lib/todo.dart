import 'package:flutter/services.dart';
import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final String description;
  final bool isComleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isComleted,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isComleted: json['isComleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isComleted,
    };
  }
}

Future<List<Todo>> getTasks() async {
  final jsonData = await rootBundle.loadString('lib/assets/tasks/tasks.json');
  final tasks = loadTasks(jsonData);
  return tasks;
}

List<Todo> loadTasks(String jsonData) {
  List<dynamic> jsonList = json.decode(jsonData);
  List<Todo> tasks = jsonList.map((json) => Todo.fromJson(json)).toList();
  return tasks;
}
