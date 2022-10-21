import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm/models/services/app_exception.dart';
import 'package:flutter_mvvm/models/services/base_service.dart';

class MediaService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    //API Logic
    var options = BaseOptions(
      baseUrl: mediaBaseURL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    Dio dio = Dio(options);

    try {
      final response = await dio.get(mediaBaseURL + url);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson;
      case 400:
        throw BadRequestException('Invalid Request');
      case 401:
      case 403:
        throw UnauthorizedException(response.data.toString());
      case 500:
        throw FetchDataException(
            'Error occured while communication with server');
      default:
    }
  }
}
