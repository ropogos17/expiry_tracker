import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveTokens(AuthTokens tokens);

  Future<void> clearTokens();

  Future<bool> hasValidTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage storage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  AuthLocalDataSourceImpl({required this.storage});

  @override
  Future<String?> getAccessToken() async {
    try {
      return await storage.read(key: _accessTokenKey);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await storage.read(key: _refreshTokenKey);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    try {
      await Future.wait([
        storage.write(key: _accessTokenKey, value: tokens.accessToken),
        storage.write(key: _refreshTokenKey, value: tokens.refreshToken),
      ]);
    } catch (e) {
      throw Exception('Failed to save tokens: $e');
    }
  }

  @override
  Future<void> clearTokens() async {
    try {
      await Future.wait([
        storage.delete(key: _accessTokenKey),
        storage.delete(key: _refreshTokenKey),
      ]);
    } catch (e) {
      // Even if clearing fails, we don't want to throw
      // as this could prevent logout
    }
  }

  @override
  Future<bool> hasValidTokens() async {
    try {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      return accessToken != null &&
          refreshToken != null &&
          accessToken.isNotEmpty &&
          refreshToken.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
