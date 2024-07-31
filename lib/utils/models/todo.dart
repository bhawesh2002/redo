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
  final String description;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final String cancellationReason;
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
  final DateTime completionDate;
  @HiveField(12)
  final DateTime completedAt;
  @HiveField(13)
  final DateTime updatedAt;
  @HiveField(14)
  final DateTime deletedAt;
  @HiveField(15)
  final DateTime cancelledAt;
  @HiveField(16)
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
}
