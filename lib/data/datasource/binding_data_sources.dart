import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';

abstract class BindingDataSources {
  Stream<String> getPreferredLanguage();
  Stream<void> updatePreferredLanguage(String code);
  Stream<LoginEntity> requestLogin(LoginBody body);

  /// movies
  Stream<SearchResultMovieEntity> getMoviesFromSearch(SearchMovieBody body);
}
