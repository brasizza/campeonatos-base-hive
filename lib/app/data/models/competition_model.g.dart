// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompetitionAdapter extends TypeAdapter<Competition> {
  @override
  final int typeId = 1;

  @override
  Competition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Competition(
      id: fields[0] as int,
      link: fields[1] as String,
      name: fields[2] as String,
      country: fields[3] as Country,
    );
  }

  @override
  void write(BinaryWriter writer, Competition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompetitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
