import 'package:flutter/material.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
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
              onPressed: nextPage,
            )
          ],
        ),
      ),
    );
  }
}
