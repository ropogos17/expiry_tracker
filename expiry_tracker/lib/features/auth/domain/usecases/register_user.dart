import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class RegisterUser implements UseCase<User, RegisterUserParams> {
  final AuthRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterUserParams params) async {
    return await repository.registerUserWithEmailPassword(
      name: params.name,
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterUserParams extends Equatable {
  final String name;
  final String username;
  final String email;
  final String password;

  const RegisterUserParams({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, username, email, password];

  @override
  bool get stringify => false;
}
