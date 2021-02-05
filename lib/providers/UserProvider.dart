import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

  Future<int> updateUser(int id, String fullname, String tb, String bb,
      String ttl, String address) async {
    final url = GlobalEndpoint.USERS_URL + "/update/" + id.toString();
    try {
      final response = await http.post(url, body: {
        'fullname': fullname,
        'tb': tb,
        'bb': bb,
        'ttl': ttl,
        'address': address,
      });

      if (response.statusCode == 200) {
        return 200;
      } else {
        return 400;
      }
    } on TimeoutException catch (_) {
      return 500;
    } on SocketException catch (_) {
      return 500;
    }
  }
}
