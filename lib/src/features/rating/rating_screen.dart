import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              'Select a minimum rating\nranging from 1-10',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.rating}',
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
              value: state.rating.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '${state.rating}',
              onChanged: (value) =>
                  ref.read(movieFlowControllerProvider.notifier).updateRating(
                        value.toInt(),
                      ),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Yes please',
              onPressed: () =>
                  ref.read(movieFlowControllerProvider.notifier).nextPage(),
            ),
          ],
        ),
      ),
    );
  }
}
