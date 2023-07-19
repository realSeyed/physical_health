import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:physical_health/models/suggestion.dart';

class SuggestionPage extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionPage({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          suggestion.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 700)],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          suggestion.description,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 18.0,
            fontVariations: const [FontVariation("wght", 400)],
          ),
        ),
      ),
    );
  }
}
