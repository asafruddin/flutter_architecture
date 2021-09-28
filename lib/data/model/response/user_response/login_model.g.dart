// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['message'] as String?,
      json['status'] as int?,
      json['data'] == null
          ? null
          : TokenModel.fromJson(json['data'] as Map<String, dynamic>),
    );

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      json['token'] as String?,
    );
