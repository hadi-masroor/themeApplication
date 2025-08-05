import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color colorOne;
  final Color colorTwo;
  final Color colorThree;
  final Color colorFour;

  const AppColors({
    required this.colorOne,
    required this.colorTwo,
    required this.colorThree,
    required this.colorFour,
  });

  @override
  AppColors copyWith({
    Color? colorOne,
    Color? colorTwo,
    Color? colorThree,
    Color? colorFour,
  }) {
    return AppColors(
      colorOne: colorOne ?? this.colorOne,
      colorTwo: colorTwo ?? this.colorTwo,
      colorThree: colorThree ?? this.colorThree,
      colorFour: colorFour ?? this.colorFour,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      colorOne: Color.lerp(colorOne, other.colorOne, t)!,
      colorTwo: Color.lerp(colorTwo, other.colorTwo, t)!,
      colorThree: Color.lerp(colorThree, other.colorThree, t)!,
      colorFour: Color.lerp(colorFour, other.colorFour, t)!,
    );
  }
}
