import 'package:flutter/material.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;
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
              'Select a minimum rating\nranging from 1-10',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${rating.ceil()}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 80,
                )
              ],
            ),
            const Spacer(),
            Slider(
              value: rating,
              min: 1,
              max: 10,
              divisions: 10,
              label: '${rating.ceil()}',
              onChanged: (value) => setState(() => rating = value),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Yes please',
              onPressed: widget.nextPage,
            ),
          ],
        ),
      ),
    );
  }
}
