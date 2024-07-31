import 'package:hive/hive.dart';

part 'subtask.g.dart';

@HiveType(typeId: 2)
class Subtask {
  @HiveField(0)
  final String todoId;
  @HiveField(1)
  final String subTaskId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final bool isDone;
  @HiveField(5)
  final DateTime completedAt;
  @HiveField(6)
  final DateTime scheduledAt;

  Subtask(
      {required this.todoId,
      required this.name,
      required this.description,
      required this.subTaskId,
      required this.isDone,
      required this.completedAt,
      required this.scheduledAt});
}
