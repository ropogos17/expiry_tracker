import 'package:dartz/dartz.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthTokens>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> refreshToken({required String refreshToken});

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, String?>> getAccessToken();

  Future<Either<Failure, String?>> getRefreshToken();

  Future<Either<Failure, void>> clearTokens();
}
