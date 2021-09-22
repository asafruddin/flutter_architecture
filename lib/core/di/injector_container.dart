// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:try_starter/core/network/client.dart';
import 'package:try_starter/data/datasource/binding/binding_local.dart';
import 'package:try_starter/data/datasource/binding/binding_remote.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/env/config.dart';

final sl = GetIt.instance;

Future<void> init() async {
  late final config = Config.getInstance();

  sl.registerLazySingleton(() => config);

  sl.registerLazySingleton(() => sl<Client>().dio);
  sl.registerLazySingleton(() => Client(config: sl()));

  sl.registerFactory(() => BindingLocal());
  sl.registerFactory(() => BindingRemote());

  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));
}
