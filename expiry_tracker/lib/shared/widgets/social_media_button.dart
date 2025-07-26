import 'package:expiry_tracker/core/models/social_media.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMedia socialMedia;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final double? width;

  const SocialMediaButton({
    super.key,
    required this.socialMedia,
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 180,
      margin: margin ?? const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: foregroundColor ?? Colors.black,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 11),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(socialMedia.assetPath, width: 32),
            SizedBox(width: 20),
            Text(socialMedia.name),
          ],
        ),
      ),
    );
  }
}
