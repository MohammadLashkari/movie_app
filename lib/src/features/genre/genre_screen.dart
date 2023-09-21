import 'package:flutter/material.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/constants/test_genres.dart';
import 'package:movie_app/src/features/genre/genre.dart';
import 'package:movie_app/src/features/genre/genre_card.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

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
  late final _controller = FixedExtentScrollController(
    initialItem: genres.length ~/ 2,
  );

  List<Genre> genres = kTestGenres;

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() => genres = updatedGenres);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Lest\'s start with a genre'.hardcoded,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 200,
                controller: _controller,
                perspective: 0.006,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: genres.length,
                  builder: (context, index) {
                    final genre = genres[index];
                    return GenreCard(
                      genre: genre,
                      onTap: () => toggleSelected(genre),
                    );
                  },
                ),
              ),
            ),
            PrimaryButton(
              onPressed: widget.nextPage,
              text: 'Continue'.hardcoded,
            )
          ],
        ),
      ),
    );
  }
}
