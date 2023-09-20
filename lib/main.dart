import 'package:flutter/material.dart';
import 'package:movie_app/src/features/movie_flow/movie_flow.dart';
import 'package:movie_app/src/localization/string_hardcoded.dart';
import 'package:movie_app/src/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Recommendation'.hardcoded,
      theme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
