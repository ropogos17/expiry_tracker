import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String text;
  final String? subtitle;
  final double? fontSize;
  final Color? color;
  final double? gap;

  const Title({
    super.key,
    required this.text,
    this.subtitle,
    this.fontSize,
    this.color,
    this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      width: double.infinity,

      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize ?? 20.0,
              fontFamily: "Sora",
              color: color ?? Colors.black,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: gap ?? 6.0),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize ?? 14.0,
                fontFamily: "Sora",
                color: color ?? Color(0xFF6B6B6B),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
