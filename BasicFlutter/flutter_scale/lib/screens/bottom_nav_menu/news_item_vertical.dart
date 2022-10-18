import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';

Widget newsItemList(List<NewsModel> news) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      NewsModel newsModel = news[index];

      return ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/news_detail', arguments: {
            'id': newsModel.id,
          });
        },
        leading: Image.network(newsModel.imageurl),
        title: Text(
          newsModel.topic,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.detail,
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}
