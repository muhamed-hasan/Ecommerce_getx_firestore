import 'dart:convert';

class UserModel {
  final String? userId;
  final String? email;
  final String? name;
  final String? pic;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.pic,
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      name: map['name'],
      pic: map['pic'],
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
