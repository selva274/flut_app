// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  ObjectId id;
  String email;
  String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
      };
}
