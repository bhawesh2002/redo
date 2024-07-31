import 'package:intl/intl.dart';

class Subtask {
  final String todoId;
  final String subTaskId;
  final String name;
  final String description;
  final bool isDone;
  final DateTime completedAt;
  final DateTime scheduledAt;

  Subtask(
      {required this.todoId,
      required this.name,
      required this.description,
      required this.subTaskId,
      required this.isDone,
      required this.completedAt,
      required this.scheduledAt});
  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      todoId: json['todoId'],
      name: json['name'],
      description: json['description'],
      subTaskId: json['subTaskId'],
      isDone: json['isDone'],
      completedAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['completedAt']),
      scheduledAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['scheduledAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todoId': todoId,
      'name': name,
      'description': description,
      'subTaskId': subTaskId,
      'isDone': isDone,
      ' completedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(completedAt),
      'scheduledAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(scheduledAt),
    };
  }
}
