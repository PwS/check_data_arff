// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_mechanic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckMechanicAdapter extends TypeAdapter<CheckMechanic> {
  @override
  final int typeId = 2;

  @override
  CheckMechanic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckMechanic()
      ..id = fields[0] as int?
      ..vehicleCheckingType = fields[1] as String?
      ..oilLeak = fields[2] as String?
      ..shiftHandle = fields[3] as String?
      ..handBreak = fields[4] as String?
      ..gasPedal = fields[5] as String?
      ..clutchPedal = fields[6] as String?
      ..machineHeating = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, CheckMechanic obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.vehicleCheckingType)
      ..writeByte(2)
      ..write(obj.oilLeak)
      ..writeByte(3)
      ..write(obj.shiftHandle)
      ..writeByte(4)
      ..write(obj.handBreak)
      ..writeByte(5)
      ..write(obj.gasPedal)
      ..writeByte(6)
      ..write(obj.clutchPedal)
      ..writeByte(7)
      ..write(obj.machineHeating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckMechanicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
