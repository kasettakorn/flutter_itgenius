// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/notification_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/profile_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/report_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/settings_screen.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/about_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/contact_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/info_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/login/register_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/welcome': (BuildContext context) => WelcomeScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => RegisterScreen(),
  '/about': (BuildContext context) => AboutScreen(),
  '/info': (BuildContext context) => InfoScreen(),
  '/contact': (BuildContext context) => ContactScreen(),
  '/dashboard': (BuildContext context) => DashboardScreen(),
  '/report': (BuildContext context) => ReportScreen(),
  '/noti': (BuildContext context) => NotificationScreen(),
  '/settings': (BuildContext context) => SettingsScreen(),
  '/profile': (BuildContext context) => ProfileScreen(),
};
