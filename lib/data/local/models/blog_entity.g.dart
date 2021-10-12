// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogEntityAdapter extends TypeAdapter<BlogEntity> {
  @override
  final int typeId = 1;

  @override
  BlogEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogEntity(
      id: fields[0] as int,
      title: fields[1] as String,
      content: fields[2] as String,
      imagePreviewURL: fields[3] as String,
      releaseDate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.imagePreviewURL)
      ..writeByte(4)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
