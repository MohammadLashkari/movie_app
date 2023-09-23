import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/features/genre/genre_card.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

class GenreScreen extends ConsumerStatefulWidget {
  const GenreScreen({super.key});

  @override
  ConsumerState<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends ConsumerState<GenreScreen> {
  late FixedExtentScrollController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final genres = ref.read(movieFlowControllerProvider).genres;
    _controller = FixedExtentScrollController(initialItem: genres.length ~/ 2);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieFlowControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
              ref.read(movieFlowControllerProvider.notifier).previousPage(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Lest\'s start with a genre'.hardcoded,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 200,
                controller: _controller,
                perspective: 0.006,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: state.genres.length,
                  builder: (context, index) {
                    final genre = state.genres[index];
                    return GenreCard(
                      genre: genre,
                      onTap: () => ref
                          .read(movieFlowControllerProvider.notifier)
                          .toggleSelected(genre),
                    );
                  },
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () =>
                  ref.read(movieFlowControllerProvider.notifier).nextPage(),
              text: 'Continue'.hardcoded,
            )
          ],
        ),
      ),
    );
  }
}
