import 'package:flutter/material.dart';

class AppConstants {
  // Text Sizes
  static const double headingSize = 24.0;
  static const double bodySize = 18.0;
  static const double keypadSize = 20.0;

  // Padding & Margins
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Spacing
  static const double spacingSmall = 4.0;
  static const double spacingMedium = 8.0;
  static const double spacingLarge = 16.0;

  // Border Radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  // Colors - FIXED: Use Colors directly instead of trying to use .shade
  static const Color primaryColor = Colors.blue;
  static const Color clearButtonColor = Colors.red;
  static const Color borderColorLight = Color(0xFFE0E0E0);  // Light gray
  static const Color borderColorMedium = Color(0xFFBDBDBD); // Medium gray
  static const Color headerBackgroundColor = Color(0xFFF5F5F5); // Very light gray
}