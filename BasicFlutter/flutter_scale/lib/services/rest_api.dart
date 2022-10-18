// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/utils/constants.dart';
import 'package:http/http.dart' as http;

class CallAPI {
  //Header API
  _setHeader() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  //Login function
  loginAPI(data) async {
    return await http.post(
      Uri.parse('$baseURLAPI/login'),
      body: jsonEncode(data),
      headers: _setHeader(),
    );
  }

  //Register function
  registerAPI(data) async {
    return await http.post(
      Uri.parse('$baseURLAPI/register'),
      body: jsonEncode(data),
      headers: _setHeader(),
    );
  }

  //fetch news api
  Future<List<NewsModel>?> getAllNews() async {
    final response = await http.get(
      Uri.parse('$baseURLAPI/news'),
      headers: _setHeader(),
    );

    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
