// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class SearchResultMovieEntity extends Equatable {
  const SearchResultMovieEntity(this.totalResults, this.Response, this.Search);

  final String? totalResults;
  final String? Response;
  final ResultMovieEntity? Search;

  @override
  List<Object?> get props => [totalResults, Response, Search];
}

class ResultMovieEntity extends Equatable {
  const ResultMovieEntity(
      this.Title, this.Year, this.imdbID, this.Type, this.Poster);

  final String? Title;
  final String? Year;
  final String? imdbID;
  final String? Type;
  final String? Poster;

  @override
  List<Object?> get props => [Title, Year, imdbID, Type, Poster];
}
