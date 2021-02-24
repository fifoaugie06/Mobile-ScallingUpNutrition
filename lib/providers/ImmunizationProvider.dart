import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/model/Immunization.dart';

class ImmunizationProvider extends ChangeNotifier {
  Immunization responseImmunization;

  Future<void> getImmunization() async {
    String url = GlobalEndpoint.IMMUNIZATION_URL;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseImmunization = Immunization.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }

  Future<int> createImmunization({
    int user_id,
    int immunization_schedule_id,
    String tanggal,
  }) async {
    String url = GlobalEndpoint.IMMUNIZATION_USER_URL;
    try {
      final response = await http.post(url, body: {
        'user_id': user_id.toString(),
        'immunization_schedule_id': immunization_schedule_id.toString(),
        'tanggal': tanggal,
      });

      print(response.body);

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
