// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/media.dart';
import 'package:flutter_mvvm/view_model/media_view_model.dart';
import 'package:provider/provider.dart';

class PlayerListWidget extends StatefulWidget {
  final List<Media> _medias;
  final Function _function;

  const PlayerListWidget(this._medias, this._function);

  @override
  State<PlayerListWidget> createState() => _PlayerListWidgetState();
}

class _PlayerListWidgetState extends State<PlayerListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget._medias.length,
            itemBuilder: (context, index) {
              Media data = widget._medias[index];
              return InkWell(
                onTap: () {
                  if (data.artistName != null) {
                    widget._function(data);
                  }
                },
                child: _buildSongItem(data),
              );
            },
          ),
          // Expanded(
          //   child: PlayerListWidget(
          //     widget._medias,
          //     (Media media) {
          //       Provider.of<MediaViewModel>(context, listen: false)
          //           .setSelectedMedia(media);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildSongItem(Media media) {
    Media? _selectedMedia = Provider.of<MediaViewModel>(context).media;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(media.artworkUrl100 ?? ''),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    media.trackName ?? '',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    media.artistName ?? '',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    media.collectionName ?? '',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
          if (_selectedMedia != null &&
              _selectedMedia.trackName == media.trackName)
            Icon(
              Icons.play_circle_outline,
              color: Theme.of(context).primaryColor,
            ),
        ],
      ),
    );
  }
}
