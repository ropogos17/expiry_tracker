import 'package:dio/dio.dart';
import 'package:expiry_tracker/core/network/network_info.dart';
import 'package:expiry_tracker/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:expiry_tracker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:expiry_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:expiry_tracker/features/auth/domain/usecases/login_usecase.dart';
import 'package:expiry_tracker/features/auth/domain/usecases/register_usecase.dart';
import 'package:expiry_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/auth/data/data_sources/auth_local_data_source.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initauth();
}

void _initauth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: Dio()),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: AuthLocalDataSourceImpl(storage: FlutterSecureStorage()),
      networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
    ),
  );
  serviceLocator.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory<LoginUseCase>(
    () => LoginUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      registerUseCase: serviceLocator(),
      loginUseCase: serviceLocator(),
    ),
  );
}
