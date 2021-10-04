// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:try_starter/domain/entity/movie_entity/search_result_movie_entity.dart';

part 'search_result_movie_model.g.dart';

@JsonSerializable(
    explicitToJson: false, createToJson: false, fieldRename: FieldRename.none)
class SearchResultMovieModel extends SearchResultMovieEntity {
  const SearchResultMovieModel({
    String? totalResults,
    String? Response,
    List<ResultMovie>? Search,
  }) : super(totalResults, Response, Search);

  factory SearchResultMovieModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultMovieModelFromJson(json);
}

@JsonSerializable(
    explicitToJson: false, createToJson: false, fieldRename: FieldRename.none)
class ResultMovie extends ResultMovieEntity {
  const ResultMovie({
    String? Title,
    String? Year,
    String? imdbID,
    String? Type,
    String? Poster,
  }) : super(Title, Year, imdbID, Type, Poster);

  factory ResultMovie.fromJson(Map<String, dynamic> json) =>
      _$ResultMovieFromJson(json);
}
