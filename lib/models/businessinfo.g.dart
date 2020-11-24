// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'businessinfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessinfoAdapter extends TypeAdapter<Businessinfo> {
  @override
  final int typeId = 1;

  @override
  Businessinfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Businessinfo(
      id: fields[0] as String,
      company: fields[1] as String,
      address1: fields[2] as String,
      address2: fields[3] as String,
      phone: fields[4] as String,
      email: fields[5] as String,
      taxid: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Businessinfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.company)
      ..writeByte(2)
      ..write(obj.address1)
      ..writeByte(3)
      ..write(obj.address2)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.taxid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessinfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
