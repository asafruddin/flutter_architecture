// ignore_for_file: sort_constructors_first, cascade_invocations

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/usecase/user_usecase/login_usecase.dart';
import 'package:try_starter/storage/local_storage.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final LoginUseCase useCase;

  final SharedPrefs prefs = sl<SharedPrefs>();
  LoginBloc(this.useCase) : super(LoginBlocInitial()) {
    on<OnLoginEvent>((event, emit) async {
      emit(LoginLoading());

      final response = useCase.execute(event.body!);

      response.listen((event) {
        event.fold((l) async => emit(LoginFailure(l.message.toString())),
            (r) async {
          print("LOGIN SUCCESS");
          await prefs.putString(KeyConstant.keyAccessToken, r.data!.token!);
          emit(LoginSuccess());
        });
      });
    });
  }
}
