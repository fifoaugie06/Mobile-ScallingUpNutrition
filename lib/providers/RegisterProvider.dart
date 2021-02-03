import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/General.dart';

class RegisterProvider extends ChangeNotifier {
  General _responseRegister;

  General get responseRegister => _responseRegister;

  Future<int> register(String username, String email, String password) async {
    final url = GlobalEndpoint.REGISTER_URL;
    try {
      final response = await http.post(url,
          body: {'username': username, 'email': email, 'password': password});

      if (response.statusCode == 200) {
        _responseRegister = General.fromJson(json.decode(response.body));

        return 200;
      } else {
        _responseRegister = General.fromJson(json.decode(response.body));

        return 400;
      }
    } on TimeoutException catch (_) {
      return 500;
    } on SocketException catch (_) {
      return 500;
    }
  }
}
