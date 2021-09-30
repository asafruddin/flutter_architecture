import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  const LanguageEntity({this.code, this.value, this.assets});

  final String? code;
  final String? value;
  final String? assets;

  @override
  List<Object?> get props => [code, assets, value];
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(
        assets: 'assets/language/id.png', code: 'id', value: 'Indonesia'),
    LanguageEntity(
        assets: 'assets/language/en.png', code: 'en', value: 'English')
  ];
}
