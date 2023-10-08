// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 1;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      date: fields[2] as String,
      description: fields[1] as String,
      title: fields[0] as String,
      index: fields[3] as int?,
      color: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.index)
      ..writeByte(4)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
