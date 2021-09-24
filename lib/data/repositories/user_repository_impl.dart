import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/domain/repositories/user_repository.dart';
import 'package:try_starter/storage/local_storage.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._bindingDataSource);

  late final BindingDataSourceFactory _bindingDataSource;
  final SharedPrefs? prefs = sl<SharedPrefs>();
}
