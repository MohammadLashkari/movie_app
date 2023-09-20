import 'package:flutter/material.dart';
import 'package:movie_app/src/features/genre/genre.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horror'),
    Genre(name: 'Drama'),
    Genre(name: 'Romance'),
    Genre(name: 'Family'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() => genres = updatedGenres);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
