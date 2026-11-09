import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class SendVerificationEmail extends UseCase<Unit, SendVerificationEmailParams> {
  final AuthRepository repository;

  SendVerificationEmail(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendVerificationEmailParams params) {
    return repository.sendVerificationEmail(email: params.email);
  }
}

class SendVerificationEmailParams extends Equatable {
  final String email;

  const SendVerificationEmailParams({required this.email});

  @override
  List<Object> get props => [email];
}
