import 'dart:ui';

import 'package:flutter/material.dart';

class TestTextField extends StatelessWidget {
  const TestTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.style,
    this.hintStyle,
    this.textDirection,
    this.hintTextDirection,
  });

  final String title, hintText;
  final TextStyle? style, hintStyle;
  final TextDirection? textDirection, hintTextDirection;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Column(
      children: <Widget>[
        // title
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 700)],
          ),
        ),
        const SizedBox(height: 15.0),
        // TextField
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 500)],
          ),
          decoration: InputDecoration(
            contentPadding:
                // for expand more than noraml, i used padding
                EdgeInsets.symmetric(vertical: size.height * 0.1),
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  color: theme.onSecondary,
                  fontSize: 25.0,
                  fontVariations: const [FontVariation("wght", 500)],
                ),
            filled: true,
            fillColor: theme.secondary,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }
}
