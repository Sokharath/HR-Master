// import 'package:flutter/material.dart';

// import 'fs_app_utils.dart';

// class AppTextStyles {
//   static final AppTextStyles instance = AppTextStyles._();
//   AppTextStyles._();

//   late Language languagePreference;

//   /// Base English TextStyle
//   TextStyle get english => TextStyle(
//         fontFamily: AppFont.instance.english,
//         fontSize: AppSize.s16.fontSize,
//         color: AppColor.instance.text,
//         fontStyle: FontStyle.normal,
//         decoration: TextDecoration.none,
//       );

//   /// Base Khmer TextStyle
//   TextStyle get khmer => TextStyle(
//         fontFamily: AppFont.instance.khmer,
//         fontSize: AppSize.s15.fontSize,
//         color: AppColor.instance.text,
//         fontStyle: FontStyle.normal,
//         decoration: TextDecoration.none,
//         letterSpacing: 0.0,
//       );

//   TextStyle get _language =>
//       languagePreference == Language.english ? english : khmer;

//   // Basic TextStyle ---------------------------------
//   TextStyle get regular => _language.copyWith(fontStyle: FontStyle.normal);

//   TextStyle get medium => _language.copyWith(fontWeight: FontWeight.w500);

//   TextStyle get semiBold => _language.copyWith(fontWeight: FontWeight.w600);

//   TextStyle get bold => _language.copyWith(fontWeight: FontWeight.bold);

//   TextStyle get black => _language.copyWith(fontWeight: FontWeight.w900);

//   TextStyle get italic => _language.copyWith(fontStyle: FontStyle.italic);
// }

// enum FSTextStyle { regular, italic, medium, semiBold, bold, black }

// extension FSTextStyleExtension on FSTextStyle {
//   TextStyle get textStyle {
//     switch (this) {
//       case FSTextStyle.regular:
//         return const TextStyle(fontStyle: FontStyle.normal);
//       case FSTextStyle.italic:
//         return const TextStyle(fontStyle: FontStyle.italic);
//       case FSTextStyle.medium:
//         return const TextStyle(
//             fontStyle: FontStyle.normal, fontWeight: FontWeight.w500);
//       case FSTextStyle.semiBold:
//         return const TextStyle(
//             fontStyle: FontStyle.normal, fontWeight: FontWeight.w600);
//       case FSTextStyle.bold:
//         return const TextStyle(
//             fontStyle: FontStyle.normal, fontWeight: FontWeight.bold);
//       case FSTextStyle.black:
//         return const TextStyle(
//             fontStyle: FontStyle.normal, fontWeight: FontWeight.w900);
//     }
//   }
// }

// extension FSTextStyleConvenience on TextStyle {
//   /// Conveniently apply [FSTextStyle] to the existing text style
//   TextStyle setStyle(FSTextStyle customTextStyle) {
//     return copyWith(
//       fontStyle: customTextStyle.textStyle.fontStyle,
//       fontWeight: customTextStyle.textStyle.fontWeight,
//     );
//   }
// }
