// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      todoId: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String?,
      location: fields[3] as String?,
      cancellationReason: fields[4] as String?,
      isDone: fields[5] as bool,
      tags: (fields[6] as List?)?.cast<String>(),
      colorHex: fields[7] as String?,
      priority: fields[8] as Prirority,
      createdAt: fields[9] as DateTime,
      scheduledAt: fields[10] as DateTime,
      completionDate: fields[11] as DateTime?,
      completedAt: fields[12] as DateTime?,
      updatedAt: fields[13] as DateTime,
      deletedAt: fields[14] as DateTime?,
      cancelledAt: fields[15] as DateTime?,
      reminderAt: fields[16] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.todoId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.cancellationReason)
      ..writeByte(5)
      ..write(obj.isDone)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.colorHex)
      ..writeByte(8)
      ..write(obj.priority)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.scheduledAt)
      ..writeByte(11)
      ..write(obj.completionDate)
      ..writeByte(12)
      ..write(obj.completedAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.deletedAt)
      ..writeByte(15)
      ..write(obj.cancelledAt)
      ..writeByte(16)
      ..write(obj.reminderAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
