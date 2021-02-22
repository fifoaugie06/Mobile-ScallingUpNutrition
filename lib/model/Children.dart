// To parse this JSON data, do
//
//     final children = childrenFromJson(jsonString);

import 'dart:convert';

Children childrenFromJson(String str) => Children.fromJson(json.decode(str));

String childrenToJson(Children data) => json.encode(data.toJson());

class Children {
  Children({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
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
    this.userId,
    this.nama,
    this.tb,
    this.bb,
    this.ttl,
    this.jeniskelamin,
    this.umur,
    this.anakke,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  String nama;
  String tb;
  String bb;
  String ttl;
  String jeniskelamin;
  int umur;
  int anakke;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        nama: json["nama"],
        tb: json["tb"],
        bb: json["bb"],
        ttl: json["ttl"],
        jeniskelamin: json["jeniskelamin"],
        umur: json["umur"],
        anakke: json["anakke"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama": nama,
        "tb": tb,
        "bb": bb,
        "ttl": ttl,
        "jeniskelamin": jeniskelamin,
        "umur": umur,
        "anakke": anakke,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
