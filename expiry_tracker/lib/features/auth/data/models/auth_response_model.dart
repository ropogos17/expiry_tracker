import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/auth_response.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends AuthResponse {
  const AuthResponseModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    // Manual parsing with null safety
    final accessToken = json['access_token'] as String?;
    final refreshToken = json['refresh_token'] as String?;

    if (accessToken == null) {
      throw Exception('access_token is null in response: $json');
    }

    if (refreshToken == null) {
      throw Exception('refresh_token is null in response: $json');
    }

    return AuthResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }
}
