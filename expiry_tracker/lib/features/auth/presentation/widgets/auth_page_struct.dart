import 'package:expiry_tracker/features/auth/presentation/widgets/login_form.dart';
import 'package:expiry_tracker/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';

enum AuthType { login, signup }

class AuthPageStruct extends StatelessWidget {
  final AuthType authType;

  const AuthPageStruct({super.key, this.authType = AuthType.login});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -90,
          top: 25,
          child: CircleAvatar(
            backgroundColor: Color(
              authType == AuthType.login ? 0xFFF59E0B : 0xFF34D399,
            ),
            radius: MediaQuery.of(context).size.width * 0.743 / 2,
          ),
        ),
        Positioned(
          left: 30,
          top: 175,
          child: Text(
            authType == AuthType.login ? "Bejelentkezés" : "Regisztráció",
            style: TextStyle(
              fontFamily: "Sora",
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        Positioned(
          bottom: -80,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.735,
            decoration: BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            ),
            child: Padding(
              padding: const EdgeInsetsGeometry.only(top: 38),
              child: authType == AuthType.login ? LoginForm() : SignupForm(),
            ),
          ),
        ),
        Positioned(
          top: 25,
          right: -6,
          child: Transform.rotate(
            angle: -0.14,
            child: Image.asset(
              "assets/images/placeholders/auth_fridge.png",
              width: 250,
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 15, top: 20),
            child: Image.asset(
              "assets/images/back.png",
              width: 35,
              color: Colors.white,
            ),
          ),
        ),
        //Positioned(bottom: 0, child: Container(child: LoginForm())),
      ],
    );
  }
}
