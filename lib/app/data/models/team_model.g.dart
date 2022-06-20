// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamAdapter extends TypeAdapter<Team> {
  @override
  final int typeId = 3;

  @override
  Team read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Team(
      team: fields[0] as String,
      teamSlug: fields[1] as String,
      teamId: fields[2] as String?,
      teamScId: fields[3] as String?,
      index: fields[4] as int?,
      matches: fields[5] as int?,
      points: fields[6] as int?,
      wins: fields[7] as int?,
      draws: fields[8] as int?,
      loses: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Team obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.team)
      ..writeByte(1)
      ..write(obj.teamSlug)
      ..writeByte(2)
      ..write(obj.teamId)
      ..writeByte(3)
      ..write(obj.teamScId)
      ..writeByte(4)
      ..write(obj.index)
      ..writeByte(5)
      ..write(obj.matches)
      ..writeByte(6)
      ..write(obj.points)
      ..writeByte(7)
      ..write(obj.wins)
      ..writeByte(8)
      ..write(obj.draws)
      ..writeByte(9)
      ..write(obj.loses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
