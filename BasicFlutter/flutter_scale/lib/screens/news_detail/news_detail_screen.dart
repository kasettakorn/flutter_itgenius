// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsDetailModel.dart';
import 'package:flutter_scale/services/rest_api.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  NewsDetailModel? _dataNews;

  readNewsDetail(id) async {
    try {
      var response = await CallAPI().getNewsDetail(id);
      setState(() {
        _dataNews = response!;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    readNewsDetail(arguments['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(_dataNews?.topic ?? '...'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(_dataNews?.imageurl ?? "..."),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(_dataNews?.topic ?? '...',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(_dataNews?.detail ?? '...',
                style: TextStyle(fontSize: 16.0)),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('วันที่ประกาศข่าว ${_dataNews?.createdAt ?? '...'}',
                style: TextStyle(fontSize: 14.0)),
          ),
        ],
      ),
    );
  }
}
