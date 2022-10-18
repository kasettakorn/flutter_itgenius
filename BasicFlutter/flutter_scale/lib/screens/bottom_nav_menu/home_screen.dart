// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //fetch news api
  readAllNews() async {
    var response = await CallAPI().getAllNews();

    log('news: $response');
  }

  @override
  void initState() {
    super.initState();
    readAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'ข่าวประกาศล่าสุด',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 210,
                child: Container(
                  color: accent,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'ข่าวทั้งหมด',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.66,
              child: FutureBuilder(
                future: CallAPI().getAllNews(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('เกิดข้อผิดพลาดในการดึงข้อมูล'));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                   
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
