import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/usecases/usecase.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class RefreshTokenParams extends Equatable {
  final String refreshToken;

  const RefreshTokenParams({required this.refreshToken});

  @override
  List<Object> get props => [refreshToken];
}

class RefreshTokenUseCase implements UseCase<String, RefreshTokenParams> {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(RefreshTokenParams params) async {
    return await repository.refreshToken(
      refreshToken: params.refreshToken,
    );
  }
}
