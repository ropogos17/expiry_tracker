class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final bool hasAvatar;
  final bool emailVerified;
  final bool phoneVerified;
  final bool twoFactorEnabled;
  final DateTime? lastLogin;
  final int loginAttempts;
  final DateTime? lockedUntil;
  final DateTime? passwordChangedAt;
  final int roleId;
  final bool isSuperuser;
  final int statusId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.hasAvatar,
    required this.emailVerified,
    required this.phoneVerified,
    required this.twoFactorEnabled,
    this.lastLogin,
    required this.loginAttempts,
    this.lockedUntil,
    this.passwordChangedAt,
    required this.roleId,
    required this.isSuperuser,
    required this.statusId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
