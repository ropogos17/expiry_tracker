import 'package:flutter/material.dart';

class Subhead extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  final String? fontFamily;

  const Subhead({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.margin,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsGeometry.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Color(0xFF6B6B6B),
          fontSize: fontSize ?? 14,
          fontFamily: fontFamily ?? "Sora",
        ),
      ),
    );
  }
}
