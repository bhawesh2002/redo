import 'package:intl/intl.dart';
import 'package:redo/utils/enums/prirority.dart';

class Todo {
  final String todoId;
  final String title;
  final String description;
  final String location;
  final String cancellationReason;
  final bool isDone;
  final List<String>? tags;
  final String? colorHex;
  final Prirority priority;
  final DateTime createdAt;
  final DateTime scheduledAt;
  final DateTime completionDate;
  final DateTime completedAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final DateTime cancelledAt;
  final DateTime reminderAt;

  Todo(
      {required this.todoId,
      required this.title,
      required this.description,
      required this.location,
      required this.cancellationReason,
      required this.isDone,
      required this.tags,
      required this.colorHex,
      required this.priority,
      required this.createdAt,
      required this.scheduledAt,
      required this.completionDate,
      required this.completedAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.cancelledAt,
      required this.reminderAt});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      todoId: json['todoId'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      cancellationReason: json['cancellationReason'],
      isDone: json['isDone'],
      tags: json['tags'] != null
          ? List<String>.from(json['tags'] as List<dynamic>)
          : null,
      colorHex: json['colorHex'],
      priority: Prirority.values[json['priority'] as int],
      createdAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['createdAt']),
      scheduledAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['scheduledAt']),
      completionDate:
          DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['completionDate']),
      completedAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['completedAt']),
      updatedAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['updatedAt']),
      deletedAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['deletedAt']),
      cancelledAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['cancelledAt']),
      reminderAt: DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json['reminderAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todoId': todoId,
      'title': title,
      'description': description,
      'location': location,
      'cancellationReason': cancellationReason,
      'isDone': isDone,
      'tags': tags,
      'colorHex': colorHex,
      'priority': priority.index,
      'createdAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(createdAt),
      'scheduledAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(scheduledAt),
      'completionDate':
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(completionDate),
      'completedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(completedAt),
      'updatedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(updatedAt),
      'deletedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(deletedAt),
      'cancelledAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(cancelledAt),
      'reminderAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(reminderAt),
    };
  }
}
