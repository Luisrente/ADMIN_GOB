// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

// String usuarioToJson(Usuario data) => json.encode(data.toJson());

Usuario usuarioFromMap(String str) => Usuario.fromMap(json.decode(str));

String usuarioToMap(Usuario data) => json.encode(data.toMap());


class Usuario {
    Usuario({
        this.document,
        this.email,
        this.name,
        this.password,
    });

    final String? document;
    final String? email;
    final String? name;
    final String? password;

    // factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    //     document: json["document"],
    //     email: json["email"],
    //     name: json["name"],
    //     password: json["password"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "document": document,
    //     "email": email,
    //     "name": name,
    //     "password": password,
    // };

        String toJson() => json.encode(toMap());


        factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        document: json["document"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "document": document,
        "email": email,
        "name": name,
        "password": password,
    };
}
