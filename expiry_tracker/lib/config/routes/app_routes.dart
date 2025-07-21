import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) =>
            const Placeholder(), // Replace with RegisterPage
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) =>
            const Placeholder(), // Replace with HomePage
      ),
    ],
    redirect: (context, state) {
      // You can add authentication-based redirects here
      final authState = context.read<AuthBloc>().state;

      // If user is not authenticated and trying to access protected routes
      if (authState is! AuthAuthenticated && state.uri.toString() == home) {
        return login;
      }

      // If user is authenticated and trying to access login page
      if (authState is AuthAuthenticated && state.uri.toString() == login) {
        return home;
      }

      return null; // No redirect needed
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.toString()}')),
    ),
  );
}
