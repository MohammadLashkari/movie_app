import 'package:flutter/material.dart';
import 'package:movie_app/src/constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p4),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get Started',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
