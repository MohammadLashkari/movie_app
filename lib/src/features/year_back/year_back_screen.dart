import 'package:flutter/material.dart';
import 'package:movie_app/src/common_widgets/primary_button.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';

class YearBackScreen extends StatefulWidget {
  const YearBackScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearBackScreen> createState() => _YearBackScreenState();
}

class _YearBackScreenState extends State<YearBackScreen> {
  double yearsBack = 10;
  @override
  Widget build(BuildContext context) {
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
                  '${yearsBack.ceil()}',
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
              value: yearsBack,
              label: '${yearsBack.ceil()}',
              min: 0,
              max: 70,
              divisions: 70,
              onChanged: (value) => setState(() => yearsBack = value),
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Amazing',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
