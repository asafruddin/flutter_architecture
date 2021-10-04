import 'package:dartz/dartz.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/datasource/common/base_datasource_factory.dart';
import 'package:try_starter/data/datasource/common/datasource_factory.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/domain/repositories/movie_repository.dart';
import 'package:try_starter/storage/local_storage.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._bindingDataSources);

  late final BindingDataSourceFactory? _bindingDataSources;
  final SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<Either<Failure, SearchResultMovieEntity>> requestSearchMovies(
      SearchMovieBody body) {
    return _bindingDataSources!
        .createData(DataSourceState.network)
        .getMoviesFromSearch(body)
        .map((event) => Right(event));
  }
}
