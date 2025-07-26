import 'package:expiry_tracker/shared/widgets/subhead.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final String? errorText;
  final String? placeholder;
  final Color? subheadColor;
  final double? subheadFontSize;
  final Widget? icon;
  final bool? isPassword;
  final bool obscurePassword;
  final VoidCallback? onToggleVisibility;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final int? passwordStrength;
  final String? passwordStrengthText;

  const InputField({
    super.key,
    required this.controller,
    this.text,
    this.errorText,
    this.placeholder,
    this.subheadColor,
    this.subheadFontSize,
    this.icon,
    this.isPassword,
    this.validator,
    this.margin,
    this.passwordStrength,
    this.passwordStrengthText,
    this.obscurePassword = true,
    this.onToggleVisibility,
  });

  List<double> getGradientStops() {
    double normalized = (passwordStrength!.clamp(0, 6)) / 6;
    normalized = double.parse(normalized.toStringAsFixed(2));
    double start = double.parse((normalized - 0.1).toStringAsFixed(2));
    double end = double.parse((normalized + 0.1).toStringAsFixed(2));

    return [start < 0 ? 0 : start, end > 1 ? 1 : end];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null)
            Subhead(
              text: text ?? "",
              fontFamily: "Inter",
              fontSize: subheadFontSize ?? 16,
              color: subheadColor,
            ),
          SizedBox(),
          Container(
            padding: EdgeInsets.all(passwordStrength != null ? 2 : 1),
            decoration: BoxDecoration(
              gradient: passwordStrength != null
                  ? LinearGradient(
                      colors: [Color(0xFF34D399), Color(0xFFD1D5DB)],
                      stops: getGradientStops(),
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : const LinearGradient(
                      colors: [Color(0xFFD1D5DB), Color(0xFFD1D5DB)],
                    ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  if (isPassword == true || icon != null)
                    Container(
                      width: isPassword == true ? 28 : 34,
                      margin: EdgeInsetsGeometry.symmetric(
                        horizontal: isPassword == true ? 17 : 15,
                        vertical: 0,
                      ),
                      child: isPassword == true
                          ? Image.asset("assets/images/lock.png")
                          : icon,
                    ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: isPassword == true ? obscurePassword : false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: placeholder,
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                      cursorHeight: 20,
                    ),
                  ),
                  if (isPassword == true)
                    InkWell(
                      onTap: onToggleVisibility,
                      child: Container(
                        width: 28,
                        margin: EdgeInsetsGeometry.symmetric(horizontal: 8),
                        child: Image.asset(
                          obscurePassword
                              ? "assets/images/eye.png"
                              : "assets/images/eye_closed.png",
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (errorText != null || isPassword == true)
            Row(
              children: [
                if (errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      errorText ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                Spacer(),
                if (isPassword == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 10),
                    child: Text(
                      passwordStrengthText ?? "",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF34D399),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
