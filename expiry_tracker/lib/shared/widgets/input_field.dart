import 'package:expiry_tracker/shared/widgets/subhead.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? placeholder;
  final Color? subheadColor;
  final double? subheadFontSize;
  final Widget? icon;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final bool? measurePasswordStrength;

  const InputField({
    super.key,
    required this.text,
    required this.controller,
    this.placeholder,
    this.subheadColor,
    this.subheadFontSize,
    this.icon,
    this.isPassword,
    this.validator,
    this.margin,
    this.measurePasswordStrength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Subhead(text: text, fontFamily: "Inter"),
          SizedBox(),
          Container(
            padding: EdgeInsets.all(measurePasswordStrength != null ? 2 : 1),
            decoration: BoxDecoration(
              gradient: measurePasswordStrength != null
                  ? const LinearGradient(
                      colors: [Color(0xFFD1D5DB), Color(0xFFD1D5DB)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFFD1D5DB), Color(0xFFD1D5DB)],
                    ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  ?icon,
                  TextFormField(
                    obscureText: isPassword ?? false,
                    decoration: InputDecoration(border: InputBorder.none),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
