// To parse this JSON data, do
//
//     final immunization = immunizationFromJson(jsonString);

import 'dart:convert';

Immunization immunizationFromJson(String str) =>
    Immunization.fromJson(json.decode(str));

String immunizationToJson(Immunization data) => json.encode(data.toJson());

class Immunization {
  Immunization({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Immunization.fromJson(Map<String, dynamic> json) => Immunization(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
