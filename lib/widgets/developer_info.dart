import 'dart:ui';

import 'package:flutter/material.dart';

class DeveloperInfo extends StatelessWidget {
  final String imagePath, name, description;

  const DeveloperInfo({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ClipOval(
          // child: Image.asset(
          //   imagePath,
          //   fit: BoxFit.cover,
          //   width: size.height * 0.2,
          //   height: size.height * 0.2,
          // ),
          child: SizedBox(
            width: size.height * 0.25,
            height: size.height * 0.25,
            child: const Placeholder(),
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          name,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: theme.primary,
            fontSize: 22.0,
            fontVariations: const [FontVariation("wght", 600)],
          ),
        ),
        Text(
          description,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: theme.onSecondary,
            fontSize: 18.0,
            fontVariations: const [FontVariation("wght", 500)],
          ),
        ),
      ],
    );
  }
}
