import 'package:flutter/material.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/features/landing/landing_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final _pageController = PageController();

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(microseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(microseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const LandingScreen(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomSheet: PrimaryButton(
        onPressed: nextPage,
      ),
    );
  }
}
