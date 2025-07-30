import 'package:expiry_tracker/features/auth/presentation/widgets/auth_page_struct.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B82F6),
      body: SafeArea(child: AuthPageStruct(authType: AuthType.login)),
    );
  }
}
