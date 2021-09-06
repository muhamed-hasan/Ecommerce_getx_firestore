import 'dart:convert';

class UserModel {
  final String userId;
  final String email;
  final String name;
  final String pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }

  String toJson() => json.encode(toMap());
}
