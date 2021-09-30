part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  const LanguageLoaded(this.locale);

  final Locale locale;
  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {}
