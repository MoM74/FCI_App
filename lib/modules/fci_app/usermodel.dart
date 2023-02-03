
import 'dart:convert';

class UserModel {
  UserModel({
    required this.status,
    required this.token,
    required this.userType,
  });

  late final bool status;
  late final String token;
  late final String userType;
  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      userType: json['user_type'],

      token:json['token'] ,

      status: json['status'],
  );
}
