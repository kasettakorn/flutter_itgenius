import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/models/media.dart';
import 'package:flutter_mvvm/models/repository/media_repository.dart';
import 'package:flutter_mvvm/models/services/api_response.dart';

class MediaViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  Media? _media;

  ApiResponse get response => _apiResponse;

  Media? get media => _media;

  Future<void> fetchMediaData(String value) async {
    _apiResponse = ApiResponse.loading('Loading media ...');
    try {
      List<Media> medias = await MediaRepository().fetchMediaList(value);
      _apiResponse = ApiResponse.completed(medias);
      print(medias);
    } catch (error) {
      _apiResponse = ApiResponse.error(error.toString());
      print(error);
    }
    notifyListeners();
  }

  void setSelectedMedia(Media? media) {
    _media = media;
    notifyListeners();
  }
}
