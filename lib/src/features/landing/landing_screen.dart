import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s find a movie',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            Image.asset('assets/images/movie.png'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
