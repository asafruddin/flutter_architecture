// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:try_starter/bloc/language/language_bloc.dart';
import 'package:try_starter/bloc/login/login_bloc.dart';
import 'package:try_starter/bloc/movie/search_movies_bloc.dart';
import 'package:try_starter/core/network/client.dart';
import 'package:try_starter/data/datasource/binding/binding_local.dart';
import 'package:try_starter/data/datasource/binding/binding_remote.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/data/repositories/app_repository_impl.dart';
import 'package:try_starter/data/repositories/movie_repository_impl.dart';
import 'package:try_starter/data/repositories/user_repository_impl.dart';
import 'package:try_starter/domain/repositories/app_repository.dart';
import 'package:try_starter/domain/repositories/movie_repository.dart';
import 'package:try_starter/domain/repositories/user_repository.dart';
import 'package:try_starter/domain/usecase/app_usecase/get_preferred_language_usecase.dart';
import 'package:try_starter/domain/usecase/app_usecase/update_preferred_language_usecase.dart';
import 'package:try_starter/domain/usecase/movie_usecase/search_movies_usecase.dart';
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
  sl.registerLazySingleton(() => Client(config: sl(), prefs: sl()));

  ///[data]
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[datasourcefactory]
  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));

  ///[repository]
  sl.registerFactory<AppRepository>(() => AppRepositoryImpl(sl()));
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerFactory<MovieRepository>(() => MovieRepositoryImpl(sl()));

  ///[usecase]
  sl.registerFactory(() => LoginUseCase(sl()));
  sl.registerFactory(() => GetPreferredLanguageUseCase(sl()));
  sl.registerFactory(() => UpdatePreferredLanguageUseCase(sl()));
  sl.registerFactory(() => SearchMoviesUseCase(sl()));

  ///[bloc]
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => LanguageBloc(
      getPreferredLanguageUseCase: sl(), updatePreferredLanguageUseCase: sl()));
  sl.registerFactory(() => SearchMoviesBloc(sl()));
}
