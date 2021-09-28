import 'package:dartz/dartz.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/datasource/common/base_datasource_factory.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/domain/repositories/user_repository.dart';
import 'package:try_starter/storage/local_storage.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._bindingDataSource);

  late final BindingDataSourceFactory _bindingDataSource;
  final SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<Either<Failure, LoginEntity>> requestLogin(LoginBody body) {
    return _bindingDataSource
        .createData(DataSourceState.network)
        .requestLogin(body)
        .map((event) => Right(event));
  }
}
