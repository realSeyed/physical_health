import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:physical_health/models/suggestion.dart';
import 'suggestion_page.dart';
import 'dart:ui';

class SuggestionListTile extends StatelessWidget {
  final Suggestion suggestion;

  const SuggestionListTile({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            PageTransition(
                child: SuggestionPage(
                  suggestion: Suggestion(
                    title: suggestion.title,
                    description: suggestion.description,
                  ),
                ),
                type: PageTransitionType.bottomToTop),
          );
        },
        leading: Icon(Icons.arrow_back, color: theme.onSecondary),
        title: Text(
          suggestion.title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).colorScheme.primary,
            fontVariations: const [FontVariation("wght", 600)],
          ),
        ),
      ),
    );
  }
}
