import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.hasAvatar,
    required super.emailVerified,
    required super.phoneVerified,
    required super.twoFactorEnabled,
    super.lastLogin,
    required super.loginAttempts,
    super.lockedUntil,
    super.passwordChangedAt,
    required super.roleId,
    required super.isSuperuser,
    required super.statusId,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
