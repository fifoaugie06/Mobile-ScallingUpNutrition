// To parse this JSON data, do
//
//     final paritas = paritasFromJson(jsonString);

import 'dart:convert';

Paritas paritasFromJson(String str) => Paritas.fromJson(json.decode(str));

String paritasToJson(Paritas data) => json.encode(data.toJson());

class Paritas {
  Paritas({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Paritas.fromJson(Map<String, dynamic> json) => Paritas(
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
    this.hamilke,
    this.tanggallahir,
    this.umurkehamilan,
    this.jenispersalinan,
    this.penolong,
    this.komplikasi,
    this.jeniskelamin,
    this.bb,
    this.tb,
    this.nifasLaktasi,
    this.nifasKomplikasi,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  String hamilke;
  DateTime tanggallahir;
  int umurkehamilan;
  String jenispersalinan;
  String penolong;
  String komplikasi;
  String jeniskelamin;
  int bb;
  int tb;
  String nifasLaktasi;
  String nifasKomplikasi;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        hamilke: json["hamilke"],
        tanggallahir: DateTime.parse(json["tanggallahir"]),
        umurkehamilan: json["umurkehamilan"],
        jenispersalinan: json["jenispersalinan"],
        penolong: json["penolong"],
        komplikasi: json["komplikasi"],
        jeniskelamin: json["jeniskelamin"],
        bb: json["bb"],
        tb: json["tb"],
        nifasLaktasi: json["nifas_laktasi"],
        nifasKomplikasi: json["nifas_komplikasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "hamilke": hamilke,
        "tanggallahir":
            "${tanggallahir.year.toString().padLeft(4, '0')}-${tanggallahir.month.toString().padLeft(2, '0')}-${tanggallahir.day.toString().padLeft(2, '0')}",
        "umurkehamilan": umurkehamilan,
        "jenispersalinan": jenispersalinan,
        "penolong": penolong,
        "komplikasi": komplikasi,
        "jeniskelamin": jeniskelamin,
        "bb": bb,
        "tb": tb,
        "nifas_laktasi": nifasLaktasi,
        "nifas_komplikasi": nifasKomplikasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
