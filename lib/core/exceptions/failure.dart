import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({this.message});

  final dynamic message;

  @override
  List<Object?> get props => [message];
}

class SocketFailure extends Failure {
  const SocketFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class AnotherFailure extends Failure {
  const AnotherFailure(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}
