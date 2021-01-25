// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
    this.message,
  });

  User user;
  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
      };
}

class User {
  User({
    this.name,
    this.email,
    this.mobileNo,
  });

  String name;
  String email;
  int mobileNo;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile_no": mobileNo,
      };
}
