// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/tabbarmenu/news_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/product_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/store_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: TabBar(tabs: [
              Tab(text: 'ข่าวสาร'),
              Tab(text: 'สินค้า'),
              Tab(text: 'ร้านค้า'),
            ]),
          ),
        ),
        body: TabBarView(
          children: [
            NewsScreen(),
            ProductScreen(),
            StoreScreen()
          ],
        ),
      ),
    );
  }
}
