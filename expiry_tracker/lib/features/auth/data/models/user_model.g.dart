// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  hasAvatar: json['hasAvatar'] as bool,
  emailVerified: json['emailVerified'] as bool,
  phoneVerified: json['phoneVerified'] as bool,
  twoFactorEnabled: json['twoFactorEnabled'] as bool,
  lastLogin: json['lastLogin'] == null
      ? null
      : DateTime.parse(json['lastLogin'] as String),
  loginAttempts: (json['loginAttempts'] as num).toInt(),
  lockedUntil: json['lockedUntil'] == null
      ? null
      : DateTime.parse(json['lockedUntil'] as String),
  passwordChangedAt: json['passwordChangedAt'] == null
      ? null
      : DateTime.parse(json['passwordChangedAt'] as String),
  roleId: (json['roleId'] as num).toInt(),
  isSuperuser: json['isSuperuser'] as bool,
  statusId: (json['statusId'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'phone': instance.phone,
  'hasAvatar': instance.hasAvatar,
  'emailVerified': instance.emailVerified,
  'phoneVerified': instance.phoneVerified,
  'twoFactorEnabled': instance.twoFactorEnabled,
  'lastLogin': instance.lastLogin?.toIso8601String(),
  'loginAttempts': instance.loginAttempts,
  'lockedUntil': instance.lockedUntil?.toIso8601String(),
  'passwordChangedAt': instance.passwordChangedAt?.toIso8601String(),
  'roleId': instance.roleId,
  'isSuperuser': instance.isSuperuser,
  'statusId': instance.statusId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};
