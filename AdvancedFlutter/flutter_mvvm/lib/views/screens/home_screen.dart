// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/media.dart';
import 'package:flutter_mvvm/models/services/api_response.dart';
import 'package:flutter_mvvm/themes/colors.dart';
import 'package:flutter_mvvm/view_model/media_view_model.dart';
import 'package:flutter_mvvm/views/screens/player_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();
    ApiResponse apiResponse = Provider.of<MediaViewModel>(context).response;
    return Scaffold(
        appBar: AppBar(
          title: Text('Spotifailed'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryText,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryText,
                        ),
                        hintText: 'กรอกชื่อศิลปิน',
                      ),
                      controller: inputController,
                      onChanged: (value) {},
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          Provider.of<MediaViewModel>(context, listen: false)
                              .setSelectedMedia(null);
                          Provider.of<MediaViewModel>(context, listen: false)
                              .fetchMediaData(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            getMediaWidget(context, apiResponse)
          ],
        ));
  }

  Widget getMediaWidget(BuildContext context, ApiResponse apiResponse) {
    List<Media>? _medias = apiResponse.data as List<Media>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: PlayerListWidget(_medias!, (Media media) {
                Provider.of<MediaViewModel>(context, listen: false)
                    .setSelectedMedia(media);
              }),
            ),
            Expanded(
              child: Container(
                color: primary,
              ),
            ),
          ],
        );
      case Status.ERROR:
        return Text('Failed! Please try again.');
      default:
        return Center(child: Text('Search the song by artist'));
    }
  }
}
