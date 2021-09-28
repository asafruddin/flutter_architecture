import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(createFactory: false)
class LoginBody {
  LoginBody({this.username, this.password});

  final String? username;
  final String? password;

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
