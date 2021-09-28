import 'package:json_annotation/json_annotation.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel(String? message, int? status, TokenModel? data)
      : super(message, status, data);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class TokenModel extends TokenEntity {
  const TokenModel(String? token) : super(token);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
