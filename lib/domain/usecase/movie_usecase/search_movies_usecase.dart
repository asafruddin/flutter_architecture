import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/core/use_case/use_case.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase
    extends UseCase<SearchResultMovieEntity, SearchMovieBody> {
  SearchMoviesUseCase(this.repository);

  final MovieRepository repository;
  @override
  Stream<Either<Failure, SearchResultMovieEntity>> build(
      SearchMovieBody params) {
    return repository.requestSearchMovies(params);
  }
}
