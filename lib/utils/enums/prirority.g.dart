// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prirority.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrirorityAdapter extends TypeAdapter<Prirority> {
  @override
  final int typeId = 1;

  @override
  Prirority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Prirority.low;
      case 1:
        return Prirority.medium;
      case 2:
        return Prirority.high;
      default:
        return Prirority.low;
    }
  }

  @override
  void write(BinaryWriter writer, Prirority obj) {
    switch (obj) {
      case Prirority.low:
        writer.writeByte(0);
        break;
      case Prirority.medium:
        writer.writeByte(1);
        break;
      case Prirority.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrirorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
