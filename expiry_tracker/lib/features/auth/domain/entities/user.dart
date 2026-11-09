import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String? email;
  final String? phone;
  final bool hasAvatar;
  final bool emailVerified;
  final bool phoneVerified;
  final bool twoFactorEnabled;
  final DateTime? lastLogin;

  const User({
    required this.id,
    required this.name,
    required this.username,
    this.email,
    this.phone,
    required this.hasAvatar,
    required this.emailVerified,
    required this.phoneVerified,
    required this.twoFactorEnabled,
    this.lastLogin,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    email,
    phone,
    hasAvatar,
    emailVerified,
    phoneVerified,
    twoFactorEnabled,
    lastLogin,
  ];
}
