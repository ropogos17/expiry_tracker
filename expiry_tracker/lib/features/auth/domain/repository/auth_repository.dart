import 'package:dartz/dartz.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> sendVerificationEmail({required String email});

  Future<Either<Failure, Unit>> confirmVerificationEmail({
    required String email,
    required String code,
  });

  Future<Either<Failure, User>> registerUserWithEmailPassword({
    required String name,
    required String username,
    required String email,
    required String password,
  });
}
