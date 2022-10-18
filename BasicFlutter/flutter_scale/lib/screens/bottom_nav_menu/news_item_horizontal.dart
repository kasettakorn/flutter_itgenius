// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';

Widget newsItemHorizontalList(List<NewsModel> news) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: news.length,
    itemBuilder: (context, index) {
      NewsModel newsModel = news[index];

      return Container(
        width: MediaQuery.of(context).size.width * 0.74,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/news_detail', arguments: {
              'id': newsModel.id,
            });
          },
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(newsModel.imageurl),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          newsModel.topic,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          newsModel.detail,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
