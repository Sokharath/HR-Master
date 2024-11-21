// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';

// enum AppStorageKey { locale, isFresh, gender, jokes }

// class AppStorage {
//   late Future<SharedPreferences> _prefs;

//   static final instance = AppStorage._defaultConstructor();
//   AppStorage._defaultConstructor() {
//     _prefs = SharedPreferences.getInstance();
//   }

//   FutureOr<bool> set<T>(AppStorageKey key, T value) async {
//     final pref = await _prefs;
//     Future<bool> result;

//     switch (value.runtimeType) {
//       case int:
//         result = pref.setInt(key.name, value as int);
//         break;
//       case double:
//         result = pref.setDouble(key.name, value as double);
//         break;
//       case bool:
//         result = pref.setBool(key.name, value as bool);
//         break;
//       case String:
//         result = pref.setString(key.name, value as String);
//         break;
//       case List<String>:
//         result = pref.setStringList(key.name, value as List<String>);
//         break;
//       default:
//         result = Future.value(false);
//         break;
//     }
//     return result;
//   }

//   Future<T?> get<T>(AppStorageKey key) async {
//     final pref = await _prefs;
//     return pref.get(key.name) as T?;
//   }

//   Future<bool> remove(AppStorageKey key) async {
//     final pref = await _prefs;
//     return pref.remove(key.name);
//   }

//   Future<void> clearStorage() async {
//     for (var element in AppStorageKey.values) {
//       final status = await remove(element);
//       if (status) {
//         log('Removed [${element.name}] from local storage.');
//       }
//     }
//   }

//   /// Working with instance of Object
//   FutureOr<bool> setObject<T>(AppStorageKey key, T value) async {
//     final pref = await _prefs;
//     final jsonString = jsonEncode(value);
//     return pref.setString(key.name, jsonString);
//   }

//   Future<T?> getObject<T>(
//       AppStorageKey key, T Function(Map<String, dynamic>) fromJson) async {
//     final pref = await _prefs;
//     final jsonString = pref.getString(key.name);
//     if (jsonString != null) {
//       final object = jsonDecode(jsonString) as Map<String, dynamic>;
//       return fromJson(object);
//     }
//     return null;
//   }
// }
