import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:physical_health/models/suggestion.dart';
import 'package:physical_health/widgets/suggestion_list_tile.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({super.key});

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "توصیه ها",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 700)],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          primary: true,
          shrinkWrap: true,
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            Suggestion suggestion = suggestions[index];
            return SuggestionListTile(suggestion: suggestion);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        ),
      ),
    );
  }
}
