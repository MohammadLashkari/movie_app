import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/features/genre/genre.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_state.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
  (ref) {
    return MovieFlowController();
  },
);

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController()
      : super(
          MovieFlowState(pageController: PageController()),
        );

  void toggleSelected(Genre genre) {
    state = state.copyWith(
      genres: [
        for (final oldGenre in state.genres)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ],
    );
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    // ----
    if (state.pageController.page! >= 1) {
      if (!state.genres.any((genre) => genre.isSelected == true)) {
        return;
      }
    }
    state.pageController.nextPage(
      duration: const Duration(microseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(microseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    super.dispose();
    state.pageController.dispose();
  }
}
