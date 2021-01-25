// To parse this JSON data, do
//
//     final genericModel = genericModelFromJson(jsonString);

import 'dart:convert';

GenericModel genericModelFromJson(String str) => GenericModel.fromJson(json.decode(str));

String genericModelToJson(GenericModel data) => json.encode(data.toJson());

class GenericModel {
    GenericModel({
        this.message,
    });

    String message;

    factory GenericModel.fromJson(Map<String, dynamic> json) => GenericModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
