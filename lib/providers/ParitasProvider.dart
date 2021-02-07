import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/model/Paritas.dart';

class ParitasProvider extends ChangeNotifier {
  Paritas responseParitas;

  Future<void> getParitas(int id) async {
    String url = GlobalEndpoint.PARITAS_URL + '/detail/' + id.toString();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseParitas = Paritas.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }

  Future<int> createParitas({
    int id,
    String hamilke,
    String tanggallahir,
    String umurkehamilan,
    String jenispersalinan,
    String penolong,
    String komplikasi,
    String jeniskelamin,
    String bb,
    String nifas_laktasi,
    String nifas_komplikasi
  }) async {
    String url = GlobalEndpoint.PARITAS_URL + '/store/' + id.toString();
    try {
      final response = await http.post(url, body: {
        'hamilke': hamilke,
        'tanggallahir': tanggallahir,
        'umurkehamilan': umurkehamilan,
        'jenispersalinan': jenispersalinan,
        'penolong': penolong,
        'komplikasi': komplikasi,
        'jeniskelamin': jeniskelamin,
        'bb': bb,
        'nifas_laktasi': nifas_laktasi,
        'nifas_komplikasi': nifas_komplikasi,
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

  Future<int> deleteParitas(int id) async {
    String url = GlobalEndpoint.PARITAS_URL + '/delete/' + id.toString();
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
