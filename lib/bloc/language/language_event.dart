part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent {
  const ToggleLanguageEvent(this.language);
  final LanguageEntity? language;

  @override
  List<Object> get props => [language!.code!];
}

class LoadPreferredLanguageEvent extends LanguageEvent {}
