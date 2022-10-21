// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  Locale _locale = Locale('en');
  Locale get locale => _locale;

  void onLocaleChange(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
