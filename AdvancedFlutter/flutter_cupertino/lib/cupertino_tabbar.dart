// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

class CupertinoTabBarDemo extends StatefulWidget {
  const CupertinoTabBarDemo({super.key});

  @override
  State<CupertinoTabBarDemo> createState() => _CupertinoTabBarDemoState();
}

class _CupertinoTabBarDemoState extends State<CupertinoTabBarDemo> {
  


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return Center(
              child: Text('Content tab: $index'),
            );
          },
        );
      },
    );
  }
}
