// import 'dart:async';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../assets/translations/easy_localize_loader.g.dart';


// enum Language { english, khmer }

// extension LanguageExtension on Language {
//   String get humanReadable {
//     switch (this) {
//       case Language.english:
//         return 'English';
//       case Language.khmer:
//         return 'ភាសាខ្មែរ';
//     }
//   }

//   String get languageCode {
//     switch (this) {
//       case Language.english:
//         return 'en';
//       case Language.khmer:
//         return 'km';
//     }
//   }

//   Locale get locale {
//     switch (this) {
//       case Language.english:
//         return const Locale('en');
//       case Language.khmer:
//         return const Locale('km');
//     }
//   }

//   String get icon {
//     switch (this) {
//       case Language.english:
//         return AppIcon.instance.enLanguage;
//       case Language.khmer:
//         return AppIcon.instance.khLanguage;
//     }
//   }
// }

// class AppLanguage {
//   static BuildContext? _context;

//   AppLanguage._defaultConstructor();
//   static final instance = AppLanguage._defaultConstructor();

//   List<Locale> get supportedLocales =>
//       Language.values.map((e) => e.locale).toList();

//   List<Language> get supportedLanguages => Language.values;

//   String get localizationPath => 'assets/translations/languages';

//   Language? get currentLanguage {
//     if (_context == null) {
//       return null;
//     }

//     final currentLocale = EasyLocalization.of(_context!)?.locale;
//     if (currentLocale == null) {
//       return null;
//     }
//     return Language.values
//         .firstWhere((element) => element.locale == currentLocale);
//   }

//   Widget languageProvider({required Widget child, Locale? locale}) {
//     return EasyLocalization(
//       startLocale: locale,
//       supportedLocales: supportedLocales,
//       fallbackLocale: supportedLocales.first,
//       path: localizationPath,
//       assetLoader: const CodegenLoader(),
//       useOnlyLangCode: true,
//       child: child,
//     );
//   }

//   static AppLanguage prepare(BuildContext context) {
//     _context = context;
//     return AppLanguage.instance;
//   }

//   static Future<void> ensureInitialized() async =>
//       EasyLocalization.ensureInitialized();

//   Language? from(String? languageCode) {
//     if (languageCode == null) return null;
//     return Language.values
//         .firstWhere((element) => element.locale.languageCode == languageCode);
//   }

//   Future<void> setLocale(Language language) async {
//     if (_context == null) {
//       return;
//     }
//     _context!.read<AppTextStyles>().languagePreference = language;
//     await EasyLocalization.of(_context!)?.setLocale(language.locale);
//     await AppStorage.instance
//         .set(AppStorageKey.locale, language.locale.languageCode);
//   }
// }
