import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/Children.dart';
import 'package:http/http.dart' as http;

class ChildrenProvider extends ChangeNotifier {
  Children responseChildren;

  Future<void> getChildren(int id) async {
    String url = GlobalEndpoint.CHILDREN_URL + '/detail/' + id.toString();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseChildren = Children.fromJson(json.decode(response.body));


      notifyListeners();

      return 200;
    }
  }

  Future<int> createChildren(int id, String nama, String tb, String bb,
      String ttl, String anakke) async {
    String url = GlobalEndpoint.CHILDREN_URL + '/store/' + id.toString();
    try {
      final response = await http.post(url, body: {
        'nama': nama,
        'tb': tb,
        'bb': bb,
        'ttl': ttl,
        'anakke': anakke,
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

  Future<int> deleteChildren(int id) async {
    String url = GlobalEndpoint.CHILDREN_URL + '/delete/' + id.toString();
    try {
      final response = await http.delete(url);

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
