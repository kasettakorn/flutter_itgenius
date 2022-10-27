// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

const String selectedLang = "selectedLand";

Future setLocale(String languageCode) async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  await _pref.setString('languageCode', languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String languageCode = _pref.getString('language') ?? 'en';
  return Locale(languageCode);
}
