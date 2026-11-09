import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class ConfirmVerificationEmail
    extends UseCase<Unit, ConfirmVerificationEmailParams> {
  final AuthRepository repository;

  ConfirmVerificationEmail(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ConfirmVerificationEmailParams params) {
    return repository.confirmVerificationEmail(
      email: params.email,
      code: params.code,
    );
  }
}

class ConfirmVerificationEmailParams extends Equatable {
  final String email;
  final String code;

  const ConfirmVerificationEmailParams({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [email, code];
}
