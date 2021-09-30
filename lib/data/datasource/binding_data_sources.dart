import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';

abstract class BindingDataSources {
  Stream<String> getPreferredLanguage();
  Stream<void> updatePreferredLanguage(String code);
  Stream<LoginEntity> requestLogin(LoginBody body);
}
