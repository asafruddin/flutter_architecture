import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:try_starter/core/constant/language_constant.dart';
import 'package:try_starter/core/use_case/use_case.dart';
import 'package:try_starter/domain/usecase/app_usecase/get_preferred_language_usecase.dart';
import 'package:try_starter/domain/usecase/app_usecase/update_preferred_language_usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(
      {required this.getPreferredLanguageUseCase,
      required this.updatePreferredLanguageUseCase})
      : super(LanguageLoaded(Locale(Languages.languages.first.code!)));

  late final GetPreferredLanguageUseCase getPreferredLanguageUseCase;
  late final UpdatePreferredLanguageUseCase updatePreferredLanguageUseCase;

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is ToggleLanguageEvent) {
      updatePreferredLanguageUseCase
          .execute(event.language!.code!)
          .listen((event) => add(LoadPreferredLanguageEvent()));
    } else if (event is LoadPreferredLanguageEvent) {
      final response = getPreferredLanguageUseCase.execute(NoParams());

      await for (final eventRes in response) {
        yield* eventRes.fold((l) async* {
          yield LanguageError();
        }, (r) async* {
          Get.updateLocale(Locale(r));
          yield LanguageLoaded(Locale(r));
        });
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
