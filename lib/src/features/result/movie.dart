import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/features/genre/genre.dart';

@immutable
class Movie extends Equatable {
  const Movie({
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });
  final String title;
  final String overView;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  factory Movie.initial() {
    return const Movie(
      title: '',
      overView: '',
      voteAverage: 0,
      genres: [],
      releaseDate: '',
    );
  }

  String get genresCommaSeparated =>
      genres.map((genre) => genre.name).toList().join(', ');

  @override
  List<Object?> get props => [
        title,
        overView,
        voteAverage,
        genres,
        releaseDate,
        backdropPath,
        posterPath
      ];

  @override
  bool get stringify => true;
}
