// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 2;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      gameId: fields[0] as String,
      time1: fields[1] as String,
      idTime1: fields[2] as String,
      placarTime1: fields[3] as int,
      time2: fields[4] as String,
      idTime2: fields[5] as String,
      placarTime2: fields[6] as int,
      status: fields[7] as String,
      dateGame: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.gameId)
      ..writeByte(1)
      ..write(obj.time1)
      ..writeByte(2)
      ..write(obj.idTime1)
      ..writeByte(3)
      ..write(obj.placarTime1)
      ..writeByte(4)
      ..write(obj.time2)
      ..writeByte(5)
      ..write(obj.idTime2)
      ..writeByte(6)
      ..write(obj.placarTime2)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.dateGame);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
