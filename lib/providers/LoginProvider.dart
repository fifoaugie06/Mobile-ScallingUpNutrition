import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/Login.dart';

class LoginProvider extends ChangeNotifier {
  Login _responseLogin;
  Login get responseLogin => _responseLogin;

  Future<int> auth(String username, String password) async {
    final url = GlobalEndpoint.LOGIN_URL;
    try {
      final response = await http
          .post(url, body: {'username': username, 'password': password});

      if(response.statusCode == 200){
        _responseLogin = Login.fromJson(json.decode(response.body));

        return 200;
      }else{
        return 400;
      }
    } on TimeoutException catch (_) {
      return 500;
    } on SocketException catch (_) {
      return 500;
    }
  }
}
