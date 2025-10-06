import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCaseParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterUseCaseParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class RegisterUseCase implements UseCase<User, RegisterUseCaseParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterUseCaseParams params) async {
    return await repository.registerWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
