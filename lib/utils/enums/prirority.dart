import 'package:hive/hive.dart';

part 'prirority.g.dart';

@HiveType(typeId: 1)
enum Prirority {
  @HiveField(0)
  low,
  @HiveField(1)
  medium,
  @HiveField(2)
  high
}
