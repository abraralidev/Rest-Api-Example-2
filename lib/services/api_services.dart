// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:project2/models/post_models.dart';

import '../constants/constants.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.Url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> Model = userModelFromJson(response.body);
        return Model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}