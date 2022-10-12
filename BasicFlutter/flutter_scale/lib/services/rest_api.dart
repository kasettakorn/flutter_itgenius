import 'dart:convert';

import 'package:flutter_scale/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_scale/models/UserModel.dart';

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
}
