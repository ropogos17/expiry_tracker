import 'package:expiry_tracker/config/theme/app_colors.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/auth_page_header.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B82F6),
      body: SafeArea(
        child: AuthPageHeader(
          title: "Bejelentkezés",
          circleColor: AppColors.secondary_green,
          bottomPadding: MediaQuery.of(context).padding.bottom,
          child: LoginForm(),
        ),
      ),
    );
  }
}
