import 'package:expiry_tracker/features/auth/domain/entities/user.dart';
import 'package:expiry_tracker/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase _registerUseCase;

  AuthBloc({required RegisterUseCase registerUseCase})
    : _registerUseCase = registerUseCase,
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
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
