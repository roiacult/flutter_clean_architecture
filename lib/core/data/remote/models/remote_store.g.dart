// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStore _$RemoteStoreFromJson(Map<String, dynamic> json) {
  return RemoteStore(
    json['ids'] as String,
    json['name'] as String,
    json['owner'] as String,
    json['email'] as String,
    json['image'] as String,
    (json['adrLat'] as num).toDouble(),
    (json['adrLong'] as num).toDouble(),
    json['adrName'] as String,
    json['number'] as String,
  );
}

Map<String, dynamic> _$RemoteStoreToJson(RemoteStore instance) =>
    <String, dynamic>{
      'ids': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'email': instance.email,
      'image': instance.image,
      'adrLat': instance.adrLat,
      'adrLong': instance.adrLong,
      'adrName': instance.adrName,
      'number': instance.number,
    };
