import 'package:expiry_tracker/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthPageHeader extends StatelessWidget {
  final String title;
  final Color circleColor;
  final double? formContainerHeight;
  final Widget? child;
  final double bottomPadding;
  final double formTopPad;

  const AuthPageHeader({
    super.key,
    required this.title,
    required this.circleColor,
    this.formContainerHeight,
    this.child,
    this.formTopPad = 0,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        final circleRadius = screenWidth * 0.37; // ~42% of screen width
        final circleRightOffset = -(screenWidth * 0.21); // ~24% negative offset
        final circleTopOffset = screenHeight * 0.03; // ~3% from top

        final titleLeftOffset = screenWidth * 0.07; // ~8% from left
        final titleTopOffset = screenHeight * 0.2; // ~22% from top
        final titleFontSize = screenWidth * 0.051; // ~5.5% of screen width

        final formBorderRadius = screenWidth * 0.09; // ~9% of screen width
        final formTopPadding =
            screenHeight * 0.04 + formTopPad; // ~4.7% of screen height

        final fridgeWidth = screenWidth * 0.58; // ~67% of screen width
        final fridgeRightOffset =
            -(screenWidth * 0.016); // ~1.6% negative offset
        final fridgeTopOffset = screenHeight * 0.03; // ~3% from top

        final backButtonSize = screenWidth * 0.075; // ~9% of screen width
        final backButtonLeftOffset = screenWidth * 0.04; // ~4% from left
        final backButtonTopOffset = screenHeight * 0.025; // ~2.5% from top

        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -(bottomPadding),
              width: constraints.maxWidth,
              height: bottomPadding,
              child: Container(color: AppColors.background),
            ),
            Positioned(
              right: circleRightOffset,
              top: circleTopOffset,
              child: CircleAvatar(
                backgroundColor: circleColor,
                radius: circleRadius,
              ),
            ),
            Positioned(
              left: titleLeftOffset,
              top: titleTopOffset,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Sora",
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: titleFontSize,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: screenWidth,
              child: Container(
                height: formContainerHeight ?? (screenHeight * 0.74),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(formBorderRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: formTopPadding),
                  child: child,
                ),
              ),
            ),
            Positioned(
              top: fridgeTopOffset,
              right: fridgeRightOffset,
              child: Transform.rotate(
                angle: -0.14,
                child: Image.asset(
                  "assets/images/placeholders/auth_fridge.png",
                  width: fridgeWidth,
                ),
              ),
            ),
            Positioned(
              left: backButtonLeftOffset,
              top: backButtonTopOffset,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/back.png",
                  width: backButtonSize,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
