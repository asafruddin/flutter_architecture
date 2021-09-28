// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:try_starter/bloc/login/login_bloc_bloc.dart';
import 'package:try_starter/core/network/client.dart';
import 'package:try_starter/data/datasource/binding/binding_local.dart';
import 'package:try_starter/data/datasource/binding/binding_remote.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/data/repositories/user_repository_impl.dart';
import 'package:try_starter/domain/repositories/user_repository.dart';
import 'package:try_starter/domain/usecase/user_usecase/login_usecase.dart';
import 'package:try_starter/env/config.dart';
import 'package:try_starter/storage/local_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [initial]
  /// important and primary
  late final config = Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  ///[environment]
  sl.registerLazySingleton(() => config);

  ///[localStorage]
  sl.registerLazySingleton(() => prefs);

  ///[network]
  sl.registerLazySingleton(() => sl<Client>().dio);
  sl.registerLazySingleton(() => Client(config: sl()));

  ///[data]
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[datasourcefactory]
  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));

  ///[repository]
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(sl()));

  ///[usecase]
  sl.registerFactory(() => LoginUseCase(sl()));

  ///[bloc]
  sl.registerFactory(() => LoginBloc(sl()));
}
