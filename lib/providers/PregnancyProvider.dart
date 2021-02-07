import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/model/Pregnancy.dart';

class PregnancyProvider extends ChangeNotifier {
  Pregnancy responsePregnancy;

  Future<void> getPregnancy(int id) async {
    String url = GlobalEndpoint.PREGNANCY_URL + '/detail/' + id.toString();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responsePregnancy = Pregnancy.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }

  Future<int> createPregnancy({
    int id,
    String pemeriksa,
    String keluhan,
    String usiakehamilan,
    String beratbadan,
    String tekanan,
    String lila,
    String fundus,
    String janin,
    String imunisasi,
    String tablet,
    String lab,
    String analisa,
    String tatalaksana,
    String konseling,
  }) async {
    String url = GlobalEndpoint.PREGNANCY_URL + '/store/' + id.toString();
    try {
      final response = await http.post(url, body: {
        'pemeriksa': pemeriksa,
        'keluhan': keluhan,
        'usiakehamilan': usiakehamilan,
        'beratbadan': beratbadan,
        'tekanan': tekanan,
        'lila': lila,
        'fundus': fundus,
        'janin': janin,
        'imunisasi': imunisasi,
        'tablet': tablet,
        'lab': lab,
        'analisa': analisa,
        'tatalaksana': tatalaksana,
        'konseling': konseling,
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

  Future<int> deletePregnancy(int id) async {
    String url = GlobalEndpoint.PREGNANCY_URL + '/delete/' + id.toString();
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
