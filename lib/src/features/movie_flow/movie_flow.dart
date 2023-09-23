import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/features/genre/genre_screen.dart';
import 'package:movie_app/src/features/landing/landing_screen.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_app/src/features/rating/rating_screen.dart';
import 'package:movie_app/src/features/year_back/year_back_screen.dart';

class MovieFlow extends ConsumerWidget {
  const MovieFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: ref.watch(movieFlowControllerProvider).pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          LandingScreen(),
          GenreScreen(),
          RatingScreen(),
          YearBackScreen(),
        ],
      ),
    );
  }
}
