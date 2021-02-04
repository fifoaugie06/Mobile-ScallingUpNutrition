import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/User.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  User responseUser;

  Future<void> getUser(int id) async {
    String url = GlobalEndpoint.USER_URL + id.toString();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseUser = User.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }
}
