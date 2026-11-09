import 'package:expiry_tracker/features/auth/domain/entities/auth_tokens.dart';
import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:expiry_tracker/features/auth/domain/usecases/login_usecase.dart';
import 'package:expiry_tracker/features/auth/domain/usecases/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  AuthBloc({
    required RegisterUseCase registerUseCase,
    required LoginUseCase loginUseCase,
  }) : _registerUseCase = registerUseCase,
       _loginUseCase = loginUseCase,
       super(AuthInitial()) {
    on<AuthRegister>((event, emit) async {
      final res = await _registerUseCase(
        RegisterUseCaseParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthRegisterSuccess(user)),
      );
    });

    on<AuthLogin>((event, emit) async {
      final res = await _loginUseCase(
        LoginUseCaseParams(email: event.email, password: event.password),
      );

      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (tokens) => emit(AuthLoginSuccess(tokens)),
      );
    });
  }
}
