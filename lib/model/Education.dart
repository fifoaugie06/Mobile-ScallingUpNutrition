// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
  Education({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
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
    this.educationCategoryId,
    this.title,
    this.photo,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.educationcategory,
  });

  int id;
  int educationCategoryId;
  String title;
  String photo;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Educationcategory educationcategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        educationCategoryId: json["education_category_id"],
        title: json["title"],
        photo: json["photo"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        educationcategory:
            Educationcategory.fromJson(json["educationcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "education_category_id": educationCategoryId,
        "title": title,
        "photo": photo,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "educationcategory": educationcategory.toJson(),
      };
}

class Educationcategory {
  Educationcategory({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Educationcategory.fromJson(Map<String, dynamic> json) =>
      Educationcategory(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
