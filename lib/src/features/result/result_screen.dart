import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/constants/app_sizes.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_app/src/features/result/movie.dart';

class ResultScreen extends ConsumerWidget {
  static router({bool fullscreenDialog = true}) => MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => const ResultScreen(),
      );
  const ResultScreen({super.key});

  final double moveHeight = 160;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieFlowControllerProvider).movie;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CoverImage(),
              Positioned(
                width: MediaQuery.sizeOf(context).width,
                bottom: -(moveHeight / 2),
                child: MovieImageDetails(
                  movie: movie,
                  movieHeight: moveHeight,
                ),
              ),
            ],
          ),
          SizedBox(height: moveHeight / 2),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              movie.overView,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Finad another movie',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        blendMode: BlendMode.dstIn,
        shaderCallback: (rect) {
          return LinearGradient(
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails({
    super.key,
    required this.movie,
    required this.movieHeight,
  });
  final Movie movie;
  final double movieHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          gapW32,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                movie.genresCommaSeparated,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Text(
                    '${movie.voteAverage}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.amber,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
