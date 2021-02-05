// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.username,
    this.fullname,
    this.tb,
    this.bb,
    this.ttl,
    this.address,
    this.email,
    this.verifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String username;
  String fullname;
  dynamic tb;
  dynamic bb;
  String ttl;
  dynamic address;
  String email;
  DateTime verifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        tb: json["tb"],
        bb: json["bb"],
        ttl: json["ttl"],
        address: json["address"],
        email: json["email"],
        verifiedAt: DateTime.parse(json["verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "tb": tb,
        "bb": bb,
        "ttl": ttl,
        "address": address,
        "email": email,
        "verified_at": verifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
