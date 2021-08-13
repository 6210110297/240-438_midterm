// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_time_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastTimeItemAdapter extends TypeAdapter<LastTimeItem> {
  @override
  final int typeId = 2;

  @override
  LastTimeItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastTimeItem(
      title: fields[0] as String,
      tag: fields[1] as String,
      lastTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LastTimeItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.tag)
      ..writeByte(2)
      ..write(obj.lastTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastTimeItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
