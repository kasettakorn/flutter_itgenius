import 'package:flutter_mvvm/utils/constant.dart';

abstract class BaseService {
  String mediaBaseURL = baseURLAPI;
  Future<dynamic> getResponse(String url);
}
