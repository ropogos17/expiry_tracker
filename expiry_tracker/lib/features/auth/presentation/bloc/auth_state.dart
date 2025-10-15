part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  final User user;

  const AuthRegisterSuccess(this.user);
}

final class AuthLoginSuccess extends AuthState {
  final AuthTokens authTokens;

  const AuthLoginSuccess(this.authTokens);
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);
}
