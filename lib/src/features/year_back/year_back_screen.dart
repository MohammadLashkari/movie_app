import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_app/src/features/result/result_screen.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

class YearBackScreen extends ConsumerWidget {
  const YearBackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieFlowControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?'.hardcoded,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.yearsBack}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Years back'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.color
                            ?.withOpacity(0.62),
                      ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: state.yearsBack.toDouble(),
              label: '${state.yearsBack}',
              min: 0,
              max: 70,
              divisions: 70,
              onChanged: (value) => ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateYearsBack(
                    value.toInt(),
                  ),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Amazing',
              onPressed: () =>
                  Navigator.of(context).push(ResultScreen.router()),
            ),
          ],
        ),
      ),
    );
  }
}
