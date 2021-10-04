import 'package:dio/dio.dart';
import 'package:try_starter/core/constant/api_path_constant.dart';
import 'package:try_starter/core/di/injector_container.dart';
import 'package:try_starter/data/datasource/binding_data_sources.dart';
import 'package:try_starter/data/model/request/login_body.dart';
import 'package:try_starter/data/model/request/search_movie_body.dart';
import 'package:try_starter/data/model/response/movie_response/search_result_movie_model.dart';
import 'package:try_starter/data/model/response/user_response/login_model.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';
import 'package:try_starter/domain/entity/user_entity/login_entity.dart';
import 'package:try_starter/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  BindingRemote(this._client);

  late final Dio _client;
  SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<LoginEntity> requestLogin(LoginBody body) async* {
    final response =
        await _client.post<dynamic>(ApiPath.login, data: body.toJson());

    yield LoginModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Stream<String> getPreferredLanguage() {
    throw UnimplementedError();
  }

  @override
  Stream<void> updatePreferredLanguage(String code) {
    throw UnimplementedError();
  }

  @override
  Stream<SearchResultMovieEntity> getMoviesFromSearch(
      SearchMovieBody body) async* {
    final response = await _client.get<dynamic>(
        'https://www.omdbapi.com/?s=${body.search}&apikey=cb75a074&r=json');

    yield SearchResultMovieModel.fromJson(
        response.data as Map<String, dynamic>);
  }
}
