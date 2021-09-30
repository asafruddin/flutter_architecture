import 'package:dartz/dartz.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/datasource/common/base_datasource_factory.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/domain/repositories/app_repository.dart';
import 'package:try_starter/storage/local_storage.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._bindingDataSource);

  late final BindingDataSourceFactory _bindingDataSource;
  final SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<Either<Failure, String>> getPreferredLanguage() {
    return _bindingDataSource
        .createData(DataSourceState.local)
        .getPreferredLanguage()
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, void>> updatePreferredLanguage(String code) {
    return _bindingDataSource
        .createData(DataSourceState.local)
        .updatePreferredLanguage(code)
        .map((event) => Right(event));
  }
}
