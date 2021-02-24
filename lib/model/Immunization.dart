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
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
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
    this.userImmunization,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  UserImmunization userImmunization;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userImmunization: json["user_immunization"] == null
            ? null
            : UserImmunization.fromJson(json["user_immunization"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "user_immunization":
            userImmunization == null ? null : userImmunization.toJson(),
      };
}

class UserImmunization {
  UserImmunization({
    this.id,
    this.userId,
    this.immunizationScheduleId,
    this.tanggal,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  int immunizationScheduleId;
  String tanggal;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory UserImmunization.fromJson(Map<String, dynamic> json) =>
      UserImmunization(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        immunizationScheduleId: json["immunization_schedule_id"] == null
            ? null
            : json["immunization_schedule_id"],
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "immunization_schedule_id":
            immunizationScheduleId == null ? null : immunizationScheduleId,
        "tanggal": tanggal == null ? null : tanggal,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
