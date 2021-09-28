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
}
