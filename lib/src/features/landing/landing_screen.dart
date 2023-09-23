import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s find a movie'.hardcoded,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            Image.asset('assets/images/movie.png'),
            const Spacer(),
            PrimaryButton(
              text: 'Get Started'.hardcoded,
              onPressed: () =>
                  ref.read(movieFlowControllerProvider.notifier).nextPage(),
            )
          ],
        ),
      ),
    );
  }
}
