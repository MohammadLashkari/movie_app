import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/constants/test_genres.dart';
import 'package:movie_app/src/features/genre/genre.dart';
import 'package:movie_app/src/features/result/movie.dart';

const kTestMovie = Movie(
  title: 'The hulk',
  overView:
      'Bruce Banner a dfdjkfjd dfjdj ddjkfdj dj dfj dkfjdkfj dkfjdk fjdkfj jfkdjf',
  voteAverage: 4.8,
  genres: [
    Genre(name: 'Action'),
    Genre(name: 'Fantasy'),
  ],
  releaseDate: '2019-05-24',
  posterPath: '',
  backdropPath: '',
);

class MovieFlowState extends Equatable {
  const MovieFlowState({
    required this.pageController,
    this.genres = kTestGenres,
    this.movie = kTestMovie,
    this.rating = 5,
    this.yearsBack = 10,
  });

  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [pageController, rating, yearsBack, genres, movie];
}
