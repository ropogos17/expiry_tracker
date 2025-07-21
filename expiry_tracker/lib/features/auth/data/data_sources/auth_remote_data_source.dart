import 'package:dio/dio.dart';
import '../../../../core/network/network_service.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  });

  Future<AuthResponseModel> refreshToken({required String refreshToken});

  Future<void> logout();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService networkService;

  AuthRemoteDataSourceImpl({required this.networkService});

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await networkService.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await networkService.dio.post(
      '/auth/register',
      data: {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> refreshToken({required String refreshToken}) async {
    final response = await networkService.dio.post(
      '/auth/refresh-token',
      data: {'refresh_token': refreshToken},
    );

    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await networkService.dio.post('/auth/logout');
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await networkService.dio.post(
      '/auth/change-password',
      data: {'old_password': oldPassword, 'new_password': newPassword},
    );
  }
}
