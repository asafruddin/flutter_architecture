import 'package:dartz/dartz.dart';
import 'package:try_starter/core/exceptions/failure.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';

abstract class MovieRepository {
  Stream<Either<Failure, SearchResultMovieEntity>> requestSearchMovies(
      SearchMovieBody body);
}
