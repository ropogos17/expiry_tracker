import 'package:dio/dio.dart';
import 'package:expiry_tracker/core/error/exceptions.dart';
import 'package:expiry_tracker/features/auth/data/models/auth_tokens_model.dart';
import 'package:expiry_tracker/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<AuthTokensModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<String> refreshToken({required String refreshToken});

  Future<void> logout(String accessToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  AuthRemoteDataSourceImpl({
    required this.dio,
    this.baseUrl = "http://localhost:8080",
  });

  @override
  Future<AuthTokensModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return AuthTokensModel.fromJson(response.data);
      } else {
        throw AuthException(response.data['error'] ?? 'Invalid credentials');
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['error'] ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<UserModel> registerWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/register',
        data: {'name': name, 'email': email, 'password': password},
      );
      print(response); //TODO: remove this

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw AuthException(response.data['error'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['error'] ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<void> logout(String accessToken) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/logout',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['error'] ?? 'Logout failed',
          statusCode: response.statusCode ?? 500,
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['error'] ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<String> refreshToken({required String refreshToken}) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        return response.data['refresh-token'];
      } else {
        throw AuthException(
          response.data['error'] ?? 'Failed to get new access token',
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['error'] ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}
