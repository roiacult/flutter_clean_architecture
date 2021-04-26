// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLogin _$RemoteLoginFromJson(Map<String, dynamic> json) {
  return RemoteLogin(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$RemoteLoginToJson(RemoteLogin instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
