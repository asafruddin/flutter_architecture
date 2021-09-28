part of 'login_bloc_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginLoading extends LoginBlocState {}

class LoginFailure extends LoginBlocState {
  const LoginFailure(this.message);

  final String message;
}

class LoginSuccess extends LoginBlocState {}
