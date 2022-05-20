


// To parse this JSON data, do
//
//     final qrData = qrDataFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


QRData qrDataFromJson(String str) => QRData.fromJson(json.decode(str));

String qrDataTojson(QRData data ) => json.encode(data.toJson());

class QRData {
    QRData({
        required this.carg,
        required this.documentId,
        required this.firstname,
        required this.plant,
        required this.secondname,
    });

    final String carg;
    final int documentId;
    final String firstname;
    final String plant;
    final String secondname;

    factory QRData.fromJson(String str) => QRData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QRData.fromMap(Map<String, dynamic> json) => QRData(
        carg: json["carg"],
        documentId: json["documentId"],
        firstname: json["firstname"],
        plant: json["plant"],
        secondname: json["secondname"],
    );

    Map<String, dynamic> toMap() => {
        "carg": carg,
        "documentId": documentId,
        "firstname": firstname,
        "plant": plant,
        "secondname": secondname,
    };
}
