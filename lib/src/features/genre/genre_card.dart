import 'package:flutter/material.dart';
import 'package:movie_app/src/features/genre/genre.dart';
import 'package:movie_app/src/theme/palette.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.onTap,
    required this.genre,
  });

  final Genre genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: genre.isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.9)
              : Palette.red300.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                genre.imgaeUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              genre.name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
