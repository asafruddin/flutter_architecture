// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultMovieModel _$SearchResultMovieModelFromJson(
        Map<String, dynamic> json) =>
    SearchResultMovieModel(
      totalResults: json['totalResults'] as String?,
      Response: json['Response'] as String?,
      Search: (json['Search'] as List<dynamic>?)
          ?.map((dynamic e) => ResultMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ResultMovie _$ResultMovieFromJson(Map<String, dynamic> json) => ResultMovie(
      Title: json['Title'] as String?,
      Year: json['Year'] as String?,
      imdbID: json['imdbID'] as String?,
      Type: json['Type'] as String?,
      Poster: json['Poster'] as String?,
    );
