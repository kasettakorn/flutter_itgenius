// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/home_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/notification_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/profile_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/report_screen.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/settings_screen.dart';
import 'package:flutter_scale/themes/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  String _title = 'Dashboard';

  final List<Widget> _children = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
    ReportScreen(),
    SettingsScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
        backgroundColor: primary,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('รณกร หอมเปาะ'),
              accountEmail: Text('kasettakorn_techno@hotmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                  'https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/298958832_5344336822301309_2596797819452426062_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeH4SZenMvv10G3svSj5iAHH7o7KuyQT3rnujsq7JBPeuUi5iiDHtaMLqk_KuB6xUdKIElq90eKJrpuJ-lXFapSn&_nc_ohc=JAcBkO80ORAAX9JcrA6&tn=O_GvTQGmuCmiLxoO&_nc_ht=scontent.fbkk28-1.fna&oh=00_AT8MmzaZcDpaDsAGsDxem2oTiupi2SbmlmpeCKtcJabZRg&oe=634A6A63',
                ),
              ),
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
    );
  }
}
