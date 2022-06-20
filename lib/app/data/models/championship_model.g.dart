// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChampionshipAdapter extends TypeAdapter<Championship> {
  @override
  final int typeId = 4;

  @override
  Championship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Championship(
      teams: (fields[0] as List).cast<Team>(),
      matches: (fields[1] as List?)?.cast<Game>(),
      futureMaches: (fields[2] as List?)?.cast<Game>(),
      competition: fields[3] as Competition?,
    );
  }

  @override
  void write(BinaryWriter writer, Championship obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.teams)
      ..writeByte(1)
      ..write(obj.matches)
      ..writeByte(2)
      ..write(obj.futureMaches)
      ..writeByte(3)
      ..write(obj.competition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChampionshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
