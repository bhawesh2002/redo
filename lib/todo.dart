import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isComleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isComleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      startTime: TimeOfDay.fromDateTime(DateTime.parse(json['startTime'])),
      endTime: TimeOfDay.fromDateTime(DateTime.parse(json['endTime'])),
      isComleted: json['isComleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'startTime': DateTime(
        date.year,
        date.month,
        date.day,
        startTime.hour,
        startTime.minute,
      ).toIso8601String(),
      'endTime': DateTime(
        date.year,
        date.month,
        date.day,
        endTime.hour,
        endTime.minute,
      ).toIso8601String(),
      'isCompleted': isComleted,
    };
  }
}

Future<List<Todo>> loadTasks(String jsonPath) async {
  return rootBundle.loadString(jsonPath).then(
    (jsonData) {
      List<dynamic> jsonList = json.decode(jsonData);
      List<Todo> tasks = jsonList.map((json) => Todo.fromJson(json)).toList();
      return tasks;
    },
  );
}
