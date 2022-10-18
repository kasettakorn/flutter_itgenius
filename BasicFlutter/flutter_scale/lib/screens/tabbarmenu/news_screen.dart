// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/news_item_horizontal.dart';
import 'package:flutter_scale/screens/bottom_nav_menu/news_item_vertical.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

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
                child: FutureBuilder(
                  future: CallAPI().getLastestNews(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('เกิดข้อผิดพลาดในการดึงข้อมูล'));
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      List<NewsModel> news = snapshot.data;
                      return newsItemHorizontalList(news);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
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
                    List<NewsModel> news = snapshot.data;
                    return newsItemList(news);
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
