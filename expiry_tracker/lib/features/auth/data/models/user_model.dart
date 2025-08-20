import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.hasAvatar,
    required super.phoneVerified,
    required super.emailVerified,
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      hasAvatar: json['has_avatar'] as bool,
      emailVerified: json['email_verified'] as bool,
      phoneVerified: json['phone_verified'] as bool,
      twoFactorEnabled: json['two_factor_enabled'] as bool,
      lastLogin: json['last_login'] != null
          ? DateTime.parse(json['last_login'] as String)
          : null,
      loginAttempts: json['login_attempts'] as int,
      lockedUntil: json['locked_until'] != null
          ? DateTime.parse(json['locked_until'] as String)
          : null,
      passwordChangedAt: json['password_changed_at'] != null
          ? DateTime.parse(json['password_changed_at'] as String)
          : null,
      roleId: json['role_id'] as int,
      isSuperuser: json['is_superuser'] as bool,
      statusId: json['status_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'has_avatar': hasAvatar,
      'email_verified': emailVerified,
      'phone_verified': phoneVerified,
      'two_factor_enabled': twoFactorEnabled,
      'last_login': lastLogin?.toIso8601String(),
      'login_attempts': loginAttempts,
      'locked_until': lockedUntil?.toIso8601String(),
      'password_changed_at': passwordChangedAt?.toIso8601String(),
      'role_id': roleId,
      'is_superuser': isSuperuser,
      'status_id': statusId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
