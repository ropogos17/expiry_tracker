import 'package:expiry_tracker/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
  );
}
