import 'package:flutter_mvvm/models/media.dart';
import 'package:flutter_mvvm/models/services/base_service.dart';
import 'package:flutter_mvvm/models/services/media_service.dart';

class MediaRepository {
  final BaseService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);

    final json = response['results'] as List;
    List<Media> medias = json.map((media) => Media.fromJson(media)).toList();

    return medias;
  }
}
