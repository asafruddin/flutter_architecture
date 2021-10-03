// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultMovieModel _$SearchResultMovieModelFromJson(
        Map<String, dynamic> json) =>
    SearchResultMovieModel(
      json['totalResults'] as String?,
      json['Response'] as String?,
      json['Search'] == null
          ? null
          : ResultMovie.fromJson(json['Search'] as Map<String, dynamic>),
    );

ResultMovie _$ResultMovieFromJson(Map<String, dynamic> json) => ResultMovie(
      json['Title'] as String?,
      json['Year'] as String?,
      json['imdbID'] as String?,
      json['Type'] as String?,
      json['Poster'] as String?,
    );
