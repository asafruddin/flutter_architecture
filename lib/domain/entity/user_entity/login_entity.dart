import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity(this.message, this.status, this.data);

  final String? message;
  final int? status;
  final TokenEntity? data;

  @override
  List<Object?> get props => [message, status, data];
}

class TokenEntity extends Equatable {
  const TokenEntity(this.token);

  final String? token;

  @override
  List<Object?> get props => [token];
}
