import 'package:flutter/material.dart';

class SubActionText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const SubActionText({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ?? EdgeInsetsGeometry.symmetric(vertical: 1, horizontal: 0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 14,
          color: color ?? Color(0xFF3B82F6),
          decorationColor: color ?? Color(0xFF3B82F6),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
