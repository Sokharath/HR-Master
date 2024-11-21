import 'package:flutter/material.dart';

class AppColor {
  static final AppColor instance = AppColor._();
  AppColor._();

  Color get primary => const Color(0xFF8F10B8);
  Color get secondary => const Color(0xFF4B245D);
  Color get error => Colors.red[900]!;
  Color get text => Colors.white;
  Color get placeholderText => Colors.grey;
  Color get placeholderDarkText => const Color(0xFF222222);
  Color get transparentBackground => Colors.black.withOpacity(0.15);
  Color get background => const Color(0xFF3B1150);

  Color get dialogBackground => Colors.white;
  Color get dialogOnBackground => Colors.black;

  Color get defaultSystemNavigationBarColor => primary;
  Color get defaultStatusBarColor => Colors.transparent;

  Color get disabledStateColor => const Color(0xFFA6A6A6);
  Color get listViewDividerColor => disabledStateColor;

  // Button Color
  Color get normalButtonColor => Colors.white;
  Color get onNormalButtonColor => const Color(0xFF8F10B8);
  Color get selectedButtonColor => primary;
  Color get onSelectedButtonColor => Colors.white;
  Color get deSelectedButtonColor => disabledStateColor;
  Color get onDeSelectedButtonColor => const Color(0xFF222222);
}
