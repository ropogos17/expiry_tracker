import 'package:expiry_tracker/features/auth/presentation/helpers/password_strength.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/question_cta.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/input_field.dart';
import '../../../../shared/widgets/submit_button.dart';

const List<String> pwdLevels = [
  "Very weak",
  "Weak",
  "Acceptable",
  "Normal",
  "Strong",
  "Very Strong",
];

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  int _passwordStrength = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordController.addListener(() {
      _checkPasswordStrength();
    });
    super.initState();
  }

  void _checkPasswordStrength() {
    setState(() {
      _passwordStrength = checkPasswordStrength(
        _passwordController.text.trim(),
      );
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry inputFieldMargin = const EdgeInsets.symmetric(
      vertical: 3.0,
      horizontal: 40,
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3),
          InputField(
            controller: _nameController,
            title: "Full Name",
            icon: Image.asset(
              "assets/images/account.png",
              color: Color(0xFF03B82F6),
            ),
            validator: (value) => null,
            placeholder: "John Sample",
            margin: inputFieldMargin,
          ),
          InputField(
            controller: _emailController,
            title: "Email",
            icon: Image.asset("assets/images/email.png"),
            validator: (value) => null,
            placeholder: "example@example.com",
            margin: inputFieldMargin,
          ),
          InputField(
            controller: _passwordController,
            title: "Password",
            icon: Image.asset("assets/images/lock.png"),
            validator: (value) => null,
            isPassword: true,
            placeholder: "•••••••••",
            margin: const EdgeInsets.only(top: 3.0, left: 40, right: 40),
            passwordStrength: _passwordStrength,
            passwordStrengthText: pwdLevels[_passwordStrength],
          ),
          InputField(
            controller: _confirmPasswordController,
            title: "Confirm password",
            icon: Image.asset("assets/images/lock.png"),
            validator: (value) => null,
            isPassword: true,
            placeholder: "•••••••••",
            margin: const EdgeInsets.symmetric(horizontal: 40),
          ),
          SubmitButton(
            text: "Create account",
            margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40),
            onPressed: () {},
          ),
          QuestionCta(
            cta: "Log in here!",
            question: "Already have account?",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
