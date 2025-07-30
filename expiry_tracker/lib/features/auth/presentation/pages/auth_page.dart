import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B82F6),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -100,
              top: 25,
              child: CircleAvatar(
                backgroundColor: Color(0xFFF59E0B),
                radius: MediaQuery.of(context).size.width * 0.743 / 2,
              ),
            ),
            Positioned(
              left: 30,
              top: 175,
              child: Text(
                "Bejelentkezés",
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
              ),
            ),
            Positioned(
              top: 40,
              right: -5,
              child: Transform.rotate(
                angle: -0.15,
                child: Image.asset(
                  "assets/images/placeholders/auth_fridge.png",
                  width: 230,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Image.asset(
                  "assets/images/back.png",
                  width: 40,
                  color: Colors.white,
                ),
              ),
            ),
            //Positioned(bottom: 0, child: Container(child: LoginForm())),
          ],
        ),
      ),
    );
  }
}
