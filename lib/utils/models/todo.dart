// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:redo/utils/enums/prirority.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String todoId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? location;
  @HiveField(4)
  final String? cancellationReason;
  @HiveField(5)
  final bool isDone;
  @HiveField(6)
  final List<String>? tags;
  @HiveField(7)
  final String? colorHex;
  @HiveField(8)
  final Prirority priority;
  @HiveField(9)
  final DateTime createdAt;
  @HiveField(10)
  final DateTime scheduledAt;
  @HiveField(11)
  final DateTime? reminderAt;
  Todo({
    required this.todoId,
    required this.title,
    this.description,
    this.location,
    this.cancellationReason,
    required this.isDone,
    this.tags,
    this.colorHex,
    required this.priority,
    required this.createdAt,
    required this.scheduledAt,
    this.reminderAt,
  });

  Todo copyWith({
    String? todoId,
    String? title,
    String? description,
    String? location,
    String? cancellationReason,
    bool? isDone,
    List<String>? tags,
    String? colorHex,
    Prirority? priority,
    DateTime? createdAt,
    DateTime? scheduledAt,
    DateTime? reminderAt,
  }) {
    return Todo(
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      isDone: isDone ?? this.isDone,
      tags: tags ?? this.tags,
      colorHex: colorHex ?? this.colorHex,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      reminderAt: reminderAt ?? this.reminderAt,
    );
  }
}
