// To parse this JSON data, do
//
//     final pregnancy = pregnancyFromJson(jsonString);

import 'dart:convert';

Pregnancy pregnancyFromJson(String str) => Pregnancy.fromJson(json.decode(str));

String pregnancyToJson(Pregnancy data) => json.encode(data.toJson());

class Pregnancy {
  Pregnancy({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Pregnancy.fromJson(Map<String, dynamic> json) => Pregnancy(
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
    this.pemeriksa,
    this.keluhan,
    this.usiakehamilan,
    this.beratbadan,
    this.tekanan,
    this.lila,
    this.fundus,
    this.janin,
    this.imunisasi,
    this.tablet,
    this.lab,
    this.analisa,
    this.tatalaksana,
    this.konseling,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  String pemeriksa;
  String keluhan;
  int usiakehamilan;
  double beratbadan;
  String tekanan;
  double lila;
  double fundus;
  double janin;
  String imunisasi;
  String tablet;
  String lab;
  String analisa;
  String tatalaksana;
  String konseling;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        pemeriksa: json["pemeriksa"],
        keluhan: json["keluhan"],
        usiakehamilan: json["usiakehamilan"],
        beratbadan: json["beratbadan"],
        tekanan: json["tekanan"],
        lila: json["lila"].toDouble(),
        fundus: json["fundus"],
        janin: json["janin"],
        imunisasi: json["imunisasi"],
        tablet: json["tablet"],
        lab: json["lab"],
        analisa: json["analisa"],
        tatalaksana: json["tatalaksana"],
        konseling: json["konseling"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pemeriksa": pemeriksa,
        "keluhan": keluhan,
        "usiakehamilan": usiakehamilan,
        "beratbadan": beratbadan,
        "tekanan": tekanan,
        "lila": lila,
        "fundus": fundus,
        "janin": janin,
        "imunisasi": imunisasi,
        "tablet": tablet,
        "lab": lab,
        "analisa": analisa,
        "tatalaksana": tatalaksana,
        "konseling": konseling,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
