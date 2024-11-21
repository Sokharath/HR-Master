import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final AppTextStyle instance = AppTextStyle._();
  AppTextStyle._();

  TextStyle get english => const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        decoration: TextDecoration.none,
      );

  TextStyle get khmer => const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 15,
        decoration: TextDecoration.none,
      );
  TextStyle get regular => const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        decoration: TextDecoration.none,
      );
  TextStyle get medium => const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        decoration: TextDecoration.none,
      );
  TextStyle get bold => const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        decoration: TextDecoration.none,
      );
}
