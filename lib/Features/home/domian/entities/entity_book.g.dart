// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityBookAdapter extends TypeAdapter<EntityBook> {
  @override
  final int typeId = 0;

  @override
  EntityBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityBook(
      bookId: fields[0] as String?,
      image: fields[1] as String?,
      title: fields[2] as String?,
      author: fields[3] as String?,
      rating: fields[4] as num?,
      price: fields[5] as num?,
      averageCount: fields[6] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, EntityBook obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.averageCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
