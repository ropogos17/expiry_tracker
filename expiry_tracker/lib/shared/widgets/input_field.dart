import 'package:expiry_tracker/config/theme/app_colors.dart';
import 'package:expiry_tracker/shared/widgets/subhead.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? errorText;
  final String? placeholder;
  final Color? subheadColor;
  final double? subheadFontSize;
  final Widget? icon;
  final bool? isPassword;
  final bool obscurePassword;
  final VoidCallback? onToggleVisibility;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? margin;
  final int? passwordStrength;
  final String? passwordStrengthText;

  const InputField({
    super.key,
    required this.controller,
    this.title,
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
    return Container(
      child: Stack(
        // fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: margin ?? const EdgeInsets.symmetric(vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Subhead(
                    text: title!,
                    fontFamily: "Inter",
                    fontSize:
                        subheadFontSize ??
                        12 * MediaQuery.textScalerOf(context).scale(1),
                    color: subheadColor ?? Color(0xFF111827),
                  ),
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
                            child: icon,
                          ),
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            validator: validator,
                            obscureText: isPassword == true
                                ? obscurePassword
                                : false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: placeholder,
                              hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 14,
                            ),
                            cursorHeight: 20,
                          ),
                        ),
                        if (isPassword == true)
                          InkWell(
                            onTap: onToggleVisibility,
                            child: Container(
                              width: 28,
                              margin: EdgeInsetsGeometry.symmetric(
                                horizontal: 8,
                              ),
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
              ],
            ),
          ),

          if (errorText != null ||
              (passwordStrengthText != null && isPassword == true))
            Positioned(
              right: 0,
              bottom: -20,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 10),
                child: Text(
                  errorText ?? passwordStrengthText!,
                  style: TextStyle(
                    fontSize: 13,
                    color: errorText != null
                        ? AppColors.delete_red
                        : Color(0xFF34D399),
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
