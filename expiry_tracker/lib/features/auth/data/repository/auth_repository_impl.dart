import 'package:dartz/dartz.dart';
import 'package:expiry_tracker/core/error/exceptions.dart';
import 'package:expiry_tracker/core/error/failures.dart';
import 'package:expiry_tracker/core/network/network_info.dart';
import 'package:expiry_tracker/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:expiry_tracker/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.registerWithEmailPassword(
          name: name,
          email: email,
          password: password,
        );
        return Right(response);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure("Connection failure"));
    }
  }

  @override
  Future<Either<Failure, AuthTokens>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.loginWithEmailPassword(
          email: email,
          password: password,
        );
        await localDataSource.saveTokens(response);
        return Right(response);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure("Connection failure"));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken({
    required String refreshToken,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.refreshToken(
          refreshToken: refreshToken,
        );
        await localDataSource.saveTokens(
          AuthTokens(accessToken: response, refreshToken: refreshToken),
        );
        return Right(response);
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure("Connection failure"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final accessToken = await localDataSource.getAccessToken();
      if (accessToken == null) {
        throw CacheException("Unable to get access token");
      }
      if (await networkInfo.isConnected) {
        await remoteDataSource.logout(accessToken);
      }
      await localDataSource.clearTokens();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final accessToken = await localDataSource.getAccessToken();
      if (accessToken == null) {
        throw CacheException("Unable to get access token");
      }
      return Right(accessToken);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final refreshToken = await localDataSource.getRefreshToken();
      if (refreshToken == null) {
        throw CacheException("Unable to get access token");
      }
      return Right(refreshToken);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearTokens() async {
    try {
      final response = await localDataSource.clearTokens();
      return Right(response);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
