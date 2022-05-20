
import 'dart:convert';
import 'package:meta/meta.dart';

// List<Carnet> carnetFromJson(String str)
//     List<Carnet>.from(json.decode(str).m  )

// String carnetToJson (List<Carnet> data) =>
//    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carnet {
    Carnet({
        required this.fullName,
        required this.documentId,
        required this.birthday,
        required this.sex,
        required this.nationality,
        required this.vaccine,
        required this.vaccinated,
        required this.issuedDate,
        required this.issuedBy,
    });

    final String fullName;
    final String documentId;
    final String birthday;
    final String sex;
    final String nationality;
    final String vaccine;
    final bool vaccinated;
    final String issuedDate;
    final String issuedBy;

    factory Carnet.fromJson(String str) => Carnet.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Carnet.fromMap(Map<String, dynamic> json) => Carnet(
        fullName: json["fullName"],
        documentId: json["documentId"],
        birthday: json["birthday"],
        sex: json["sex"],
        nationality: json["nationality"],
        vaccine: json["vaccine"],
        vaccinated: json["vaccinated"],
        issuedDate: json["issuedDate"],
        issuedBy: json["issuedBy"],
    );

    Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "documentId": documentId,
        "birthday": birthday,
        "sex": sex,
        "nationality": nationality,
        "vaccine": vaccine,
        "vaccinated": vaccinated,
        "issuedDate": issuedDate,
        "issuedBy": issuedBy,
    };
}



