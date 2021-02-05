import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scallingupnutrition/config/GlobalEndpoint.dart';
import 'package:http/http.dart' as http;
import 'package:scallingupnutrition/model/EducationCategory.dart';

class EducationCategoryProvider extends ChangeNotifier {
  EducationCategory responseEducationCategory;

  Future<void> getEducation() async {
    String url = GlobalEndpoint.EDUCATION_CATEGORY_URL + "?order=id desc";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      responseEducationCategory =
          EducationCategory.fromJson(json.decode(response.body));

      notifyListeners();

      return 200;
    }
  }
}
