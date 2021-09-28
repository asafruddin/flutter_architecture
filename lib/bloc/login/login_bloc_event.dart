part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class OnLoginEvent extends LoginBlocEvent {
  const OnLoginEvent(this.body);

  final LoginBody? body;
}
