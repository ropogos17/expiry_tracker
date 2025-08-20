import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginUseCase implements UseCase<AuthTokens, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthTokens>> call(LoginParams params) async {
    return await repository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}
