import 'package:flutter/material.dart';

class AppColors {
  static const Color warning = Color(0xFFE53935);
  static const Color success = Color(0xFF43A047);
  static const Color customText = Color(0xFF4A148C);
}

extension CustomColors on ThemeData {
  Color get warningColor => AppColors.warning;
  Color get successColor => AppColors.success;
  Color get customTextColor => AppColors.customText;
}
