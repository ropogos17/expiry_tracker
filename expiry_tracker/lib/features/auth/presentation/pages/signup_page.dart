import 'package:flutter/material.dart';

import '../widgets/auth_page_struct.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B82F6),
      body: SafeArea(child: AuthPageStruct(authType: AuthType.signup)),
    );
  }
}
