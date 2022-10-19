// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/home_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/notification_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/profile_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/report_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/settings_screen.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SharedPreferences sharedPreferences;

  String? _fullname, _username, _avatar, _userStatus;

  int _currentIndex = 0;
  String _title = 'Dashboard';

  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void onBottomBarTapChange(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'หน้าหลัก';
          break;
        case 1:
          _title = 'รายงาน';
          break;
        case 2:
          _title = 'การแจ้งเตือน';
          break;
        case 3:
          _title = 'ตั้งค่า';
          break;
        case 4:
          _title = 'โปรไฟล์';
          break;
        default:
      }
    });
  }

  readUserProfile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _fullname = sharedPreferences.getString('fullName');
      _username = sharedPreferences.getString('userName');
      _avatar = sharedPreferences.getString('imgProfile');
      _userStatus = sharedPreferences.getString('userStatus');
    });
  }

  logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('คุณแน่ใจหรือไม่ ?'),
                  content: Text('คุณแน่ใจที่จะออกจากแอพหรือไม่'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Yes'),
                    ),
                  ],
                ))) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    readUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _children[_currentIndex],
        drawer: Drawer(
          backgroundColor: primary,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(_fullname ?? "..."),
                accountEmail: Text(_username ?? "..."),
                currentAccountPicture: _avatar != null
                    ? CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                        ),
                      )
                    : CircularProgressIndicator(),
                decoration: BoxDecoration(
                  color: primaryDark,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: icons,
                ),
                title: Text(
                  'เกี่ยวกับเรา',
                  style: TextStyle(color: icons),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: icons,
                ),
                title: Text(
                  'ข้อมูลการใช้งาน',
                  style: TextStyle(color: icons),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/info');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.mail,
                  color: icons,
                ),
                title: Text(
                  'ติดต่อทีมงาน',
                  style: TextStyle(color: icons),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: icons,
                ),
                title: Text(
                  'ออกจากระบบ',
                  style: TextStyle(color: icons),
                ),
                onTap: () {
                  logout();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onBottomBarTapChange,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined),
              label: 'รายงาน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'การแจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'ตั้งค่า',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'โปรไฟล์',
            ),
          ],
        ),
      ),
    );
  }
}
