// To parse this JSON data, do
//
//     final carnet = carnetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Carnet carnetFromJson(String str) => Carnet.fromJson(json.decode(str));

String carnetToJson(Carnet data) => json.encode(data.toJson());

class Carnet {
    Carnet({
         this.birthday,
         this.carg,
         this.documentId,
         this.email,
         this.fechaingreso,
         this.firstname,
         this.plant,
         this.secondsname,
         this.sex,
    });

    final String? birthday;
    final String? carg;
    final int? documentId;
    final String? email;
    final String? fechaingreso;
    final String? firstname;
    final String? plant;
    final String? secondsname;
    final String? sex;

    factory Carnet.fromJson(Map<String, dynamic> json) => Carnet(
        birthday: json["birthday"],
        carg: json["carg"],
        documentId: json["documentId"],
        email: json["email"],
        fechaingreso: json["fechaingreso"],
        firstname: json["firstname"],
        plant: json["plant"],
        secondsname: json["secondsname"],
        sex: json["sex"],
    );

    Map<String, dynamic> toJson() => {
        "birthday": birthday,
        "carg": carg,
        "documentId": documentId,
        "email": email,
        "fechaingreso": fechaingreso,
        "firstname": firstname,
        "plant": plant,
        "secondsname": secondsname,
        "sex": sex,
    };
}
