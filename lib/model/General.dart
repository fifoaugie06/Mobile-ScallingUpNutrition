// To parse this JSON data, do
//
//     final general = generalFromJson(jsonString);

import 'dart:convert';

General generalFromJson(String str) => General.fromJson(json.decode(str));

String generalToJson(General data) => json.encode(data.toJson());

class General {
  General({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory General.fromJson(Map<String, dynamic> json) => General(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
