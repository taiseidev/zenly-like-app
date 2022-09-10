// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      name: json['name'] as String,
      mail: json['mail'] as String,
      createdAt: timestampConverter.fromJson(json['createdAt']),
      updateAt: timestampConverter.fromJson(json['updateAt']),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mail': instance.mail,
      'createdAt': timestampConverter.toJson(instance.createdAt),
      'updateAt': timestampConverter.toJson(instance.updateAt),
      'imageUrl': instance.imageUrl,
    };
