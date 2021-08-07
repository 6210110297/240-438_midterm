// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_number.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageNumberAdapter extends TypeAdapter<PageNumber> {
  @override
  final int typeId = 0;

  @override
  PageNumber read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageNumber()..number = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, PageNumber obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageNumberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
