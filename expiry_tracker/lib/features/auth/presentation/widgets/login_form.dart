import 'package:expiry_tracker/core/constants/auth_constants.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/question_cta.dart';
import 'package:expiry_tracker/shared/widgets/input_field.dart';
import 'package:expiry_tracker/shared/widgets/social_media_button.dart';
import 'package:expiry_tracker/shared/widgets/subaction_text.dart';
import 'package:expiry_tracker/shared/widgets/submit_button.dart';
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputField(
            controller: _emailController,
            title: "Email",
            icon: Image.asset("assets/images/email.png"),
            validator: (value) => null,
            placeholder: "example@example.com",
          ),
          InputField(
            controller: _passwordController,
            title: "Password",
            icon: Image.asset("assets/images/lock.png"),
            validator: (value) => null,
            isPassword: true,
            placeholder: "•••••••••",
            onToggleVisibility: () => setState(() {
              _obscurePassword = !_obscurePassword;
            }),
            obscurePassword: _obscurePassword,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: SubActionText(text: "Forgot password?"),
          ),
          SubmitButton(
            text: "Bejelentkezés",
            margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
            onPressed: () {},
          ),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Color(0xFFD1D5DB),
                  thickness: 1.5,
                ),
                Container(
                  color: Color(0xFFF9FAFB),
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Text(
                    "Or just login with",
                    style: TextStyle(fontFamily: "Sora", fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton(
                  socialMedia: AuthConstants.google,
                  onPressed: () {},
                ),
                SocialMediaButton(
                  socialMedia: AuthConstants.facebook,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          QuestionCta(
            cta: "Sign up here!",
            question: "Not registered yet?",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
