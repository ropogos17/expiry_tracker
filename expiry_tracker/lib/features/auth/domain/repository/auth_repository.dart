import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/auth_response.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> register({
    required String name,
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> refreshToken({
    required String refreshToken,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
