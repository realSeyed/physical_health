import 'dart:ui';
import 'package:flutter/material.dart';

class ShowResualt extends StatelessWidget {
  const ShowResualt({
    super.key,
    required this.title,
    required this.resualt,
  });

  final String title, resualt;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bmi resualt
        Text(
          resualt,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 22.0,
            fontVariations: const [FontVariation("wght", 600)],
          ),
        ),
        const SizedBox(width: 10.0),
        // resualt title
        // for over flow i wraped it on Expanded
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: theme.background,
              fontSize: 20.0,
              fontVariations: const [FontVariation("wght", 600)],
            ),
          ),
        ),
      ],
    );
  }
}
