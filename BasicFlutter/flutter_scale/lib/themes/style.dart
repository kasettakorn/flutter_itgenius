// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'IBM_Plex_Sans_Thai',
    primaryColor: primary,
    errorColor: accent,
    hoverColor: divider,
    colorScheme: ColorScheme.light(primary: primaryText),
    iconTheme: IconThemeData(color: primaryText),
    scaffoldBackgroundColor: icons,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    ),
  );
}
