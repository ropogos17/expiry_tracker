import 'package:expiry_tracker/shared/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputField(
              controller: _emailController,
              title: "Email",
              icon: Image.asset("assets/images/email.png"),
              validator: (value) => null,
            ),
          ],
        ),
      ),
    );
  }
}
