import 'dart:io';

import 'package:expiry_tracker/config/theme/app_colors.dart';
import 'package:expiry_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/auth_page_header.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/question_cta.dart';
import 'package:expiry_tracker/shared/widgets/checkbox.dart';
import 'package:expiry_tracker/shared/widgets/input_field.dart';
import 'package:expiry_tracker/shared/widgets/submit_button.dart';
import 'package:flutter/material.dart' hide Checkbox;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/password_strength.dart';

const List<String> pwdLevels = [
  "Very weak",
  "Weak",
  "Acceptable",
  "Normal",
  "Strong",
  "Very Strong",
];

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.background,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }

    final inputFieldIconSize = MediaQuery.of(context).size.height * 0.03;

    return Scaffold(
      backgroundColor: Color(0xFF3B82F6),
      body: SafeArea(
        child: AuthPageHeader(
          bottomPadding: MediaQuery.of(context).padding.bottom,
          title: "Sign Up",
          circleColor: AppColors.secondary_green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  print('Registration Error: ${state.message}');

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3),
                        InputField(
                          controller: _nameController,
                          title: "Full Name",
                          icon: Image.asset(
                            "assets/images/account.png",
                            width: inputFieldIconSize,
                            height: inputFieldIconSize,
                            color: AppColors.primary,
                          ),
                          validator: (value) => null,
                          placeholder: "John Sample",
                        ),
                        InputField(
                          controller: _emailController,
                          title: "Email",
                          icon: Image.asset(
                            "assets/images/email.png",
                            width: inputFieldIconSize,
                            height: inputFieldIconSize,
                          ),
                          validator: (value) => null,
                          placeholder: "example@example.com",
                        ),
                        InputField(
                          controller: _passwordController,
                          title: "Password",
                          icon: Image.asset(
                            "assets/images/lock.png",
                            width: inputFieldIconSize,
                            height: inputFieldIconSize,
                          ),
                          validator: (value) => null,
                          isPassword: true,
                          placeholder: "•••••••••",
                          passwordStrength: _passwordStrength,
                          passwordStrengthText: pwdLevels[_passwordStrength],
                        ),
                        InputField(
                          controller: _confirmPasswordController,
                          title: "Confirm password",
                          icon: Image.asset(
                            "assets/images/lock.png",
                            width: inputFieldIconSize,
                            height: inputFieldIconSize,
                          ),
                          validator: (value) => null,
                          isPassword: true,
                          placeholder: "•••••••••",
                        ),
                        Checkbox(
                          checkboxSize:
                              MediaQuery.of(context).size.height * 0.026,
                          description: RichText(
                            softWrap: true,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "I accept the "),
                                TextSpan(
                                  text: "Terms and Conditions",
                                  style: TextStyle(
                                    color: Color(0xFF3B82F6),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: " and the "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Color(0xFF3B82F6),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: "."),
                              ],
                            ),
                          ),
                          onTap: () {},
                          isChecked: false,
                          margin: const EdgeInsets.only(top: 10, bottom: 2),
                        ),
                        SubmitButton(
                          text: "Create account",
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                AuthRegister(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                        QuestionCta(
                          cta: "Log in here!",
                          question: "Already have account?",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
