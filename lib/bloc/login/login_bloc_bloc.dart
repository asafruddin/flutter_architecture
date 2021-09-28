// ignore_for_file: sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/domain/usecase/user_usecase/login_usecase.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc(this.useCase) : super(LoginBlocInitial());
  final LoginUseCase useCase;

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) async* {
    if (event is OnLoginEvent) {
      yield LoginLoading();

      // ignore: omit_local_variable_types
      final Stream<Either<Failure, LoginEntity>> response =
          useCase.execute(event.body!);

      await for (final eventRes in response) {
        yield* eventRes.fold((l) async* {
          yield LoginFailure(l.toString());
        }, (r) async* {
          yield LoginSuccess();
        });
      }
    }
  }
}
