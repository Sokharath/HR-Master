import 'package:flutter/material.dart';

class AppDecoration {
  static final AppDecoration instance = AppDecoration._();
  AppDecoration._();

  BoxDecoration get defaultBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      );
}
