// ignore_for_file: avoid_print

import 'package:rxdart/rxdart.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/domain/usecase/movie_usecase/search_movies_usecase.dart';

class SearchMoviesBloc {
  SearchMoviesBloc(this.useCase);

  final SearchMoviesUseCase useCase;

  final _moviesData = BehaviorSubject<SearchResultMovieEntity>();

  Function(SearchResultMovieEntity) get updateMovies => _moviesData.sink.add;

  Stream<SearchResultMovieEntity> get data => _moviesData.stream;

  void fetchSearchMovies(SearchMovieBody body) {
    useCase.execute(body).listen((event) {
      event.fold<dynamic>((l) {
        print('something went wrong when get data movies : $l');
        _moviesData.addError(l);
      }, (r) => updateMovies(r));
    });
  }

  void dispose() {
    _moviesData.close();
  }
}
