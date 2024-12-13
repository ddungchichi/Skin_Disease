import 'package:flutter/material.dart';

class AppStyles {
  static const Color backgroundColor = Color(0xFFF9F7FC);
  static const Color buttonBackgroundColor = Color(0xFFF0EAFB);

  static BoxDecoration boxDecoration(double screenWidth) {
    return BoxDecoration(
      color: buttonBackgroundColor,
      borderRadius: BorderRadius.circular(screenWidth * 0.03),
    );
  }

  static TextStyle hintStyle(double screenWidth) {
    return TextStyle(
      color: Colors.grey,
      fontSize: screenWidth * 0.045,
    );
  }

  static TextStyle categoryTextStyle(double screenWidth) {
    return TextStyle(
      color: Colors.black,
      fontSize: screenWidth * 0.049,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle buttonTextStyle(double screenWidth) {
    return TextStyle(
      color: Colors.black,
      fontSize: screenWidth * 0.05,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subtitleStyle(double screenWidth) {
    return TextStyle(
      fontSize: screenWidth * 0.04,
      color: const Color(0xFF868181),
      fontWeight: FontWeight.w600,
    );
  }
}
