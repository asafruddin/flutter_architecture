import 'package:try_starter/core/constant/key_constant.dart';
import 'package:try_starter/core/constant/language_constant.dart';
import 'package:try_starter/data/datasource/binding_data_sources.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  BindingLocal(this.prefs);

  final SharedPrefs? prefs;

  @override
  Stream<LoginEntity> requestLogin(LoginBody body) {
    throw UnimplementedError();
  }

  @override
  Stream<String> getPreferredLanguage() async* {
    yield prefs!.getString(KeyConstant.keyLanguage) ??
        Languages.languages.first.code!;
  }

  @override
  Stream<void> updatePreferredLanguage(String code) async* {
    yield prefs!.putString(KeyConstant.keyLanguage, code);
  }
}
