import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:scallingupnutrition/model/Education.dart';
import 'package:http/http.dart' as http;

class EducationProvider extends ChangeNotifier {
  Education responseEducation;

  Future<void> getEducation() async {
    String url = GlobalEndpoint.EDUCATION_URL + "?order=id desc&limit=5";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseEducation = Education.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }
}
