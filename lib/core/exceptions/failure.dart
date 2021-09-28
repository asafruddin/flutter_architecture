// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message});

  final dynamic message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({this.message});

  @override
  final dynamic message;

  @override
  List<Object?> get props => [message];
}

class SocketFailure extends Failure {
  const SocketFailure({this.message});

  @override
  final String? message;

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure(this.message);

  @override
  final String? message;

  @override
  List<Object?> get props => [message];
}

class AnotherFailure extends Failure {
  const AnotherFailure(this.message);

  @override
  final String? message;

  @override
  List<Object?> get props => [message];
}
