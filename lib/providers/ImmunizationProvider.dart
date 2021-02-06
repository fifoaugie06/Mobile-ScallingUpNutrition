import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/Education.dart';
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
}
