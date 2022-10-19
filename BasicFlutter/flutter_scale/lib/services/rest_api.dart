// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter_scale/models/NewsDetailModel.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/models/ProductsModel.dart';
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

  //fetch recent news api
  Future<List<NewsModel>?> getLastestNews() async {
    final response = await http.get(
      Uri.parse('$baseURLAPI/lastnews'),
      headers: _setHeader(),
    );

    if (response.body != null) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //fetch news detail api
  Future<NewsDetailModel?> getNewsDetail(id) async {
    final response = await http.get(
      Uri.parse('$baseURLAPI/news/$id'),
      headers: _setHeader(),
    );

    if (response.body != null) {
      return newsDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //============== Product CRUD =================
  //Get All Products
  Future<List<ProductsModel>?> getAllProducts() async {
    final response = await http.get(
      Uri.parse('$baseURLAPI/products'),
      headers: _setHeader(),
    );

    if (response.body != null) {
      return productsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //Add Products
  Future<bool> createProduct(ProductsModel data) async {
    final response = await http.post(
      Uri.parse('$baseURLAPI/products'),
      headers: _setHeader(),
      body: productsModelToJson(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Edit Products
  Future<bool> updateProduct(ProductsModel data) async {
    final response = await http.put(
      Uri.parse('$baseURLAPI/products/${data.id}'),
      headers: _setHeader(),
      body: productsModelToJson(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Remove Products
  Future<bool> deleteProduct(ProductsModel data) async {
    final response = await http.delete(
      Uri.parse('$baseURLAPI/products/${data.id}'),
      headers: _setHeader()
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
