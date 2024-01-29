import 'package:flutter/services.dart';
import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final bool isComleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.isComleted,
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
      isComleted: json['isComleted'] ?? false,
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
      'isCompleted': isComleted,
    };
  }
}

Future<List<Todo>> getTasks() async {
  final jsonData = await rootBundle.loadString('lib/assets/tasks/tasks.json');
  List<dynamic> jsonList = json.decode(jsonData);
  List<Todo> tasks = jsonList.map((json) => Todo.fromJson(json)).toList();
  return tasks;
}
