import 'package:flutter/material.dart';

Widget newsItemList() {
  return  List<NewsModel> news = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        NewsModel newsModel = news[index];

                        return ListTile(
                          leading: Icon(Icons.pages),
                          title: Text(
                            newsModel.topic,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            newsModel.detail,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                        
                          },
                        );
                      },
                    );
}