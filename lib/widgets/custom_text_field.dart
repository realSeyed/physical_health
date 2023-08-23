import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.textDirection,
    this.hintTextDirection,
    this.style,
    this.hintStyle,
  });

  final TextEditingController controller;
  final String label, hintText;
  final TextDirection? textDirection, hintTextDirection;
  final TextStyle? style, hintStyle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme theme = Theme.of(context).colorScheme;
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: TextField(
        controller: controller,
        // input textStyle
        style: style ??
            TextStyle(
              color: theme.primary,
              fontSize: 20.0,
              fontVariations: const [FontVariation("wght", 500)],
            ),
        // input textDirection
        textDirection: textDirection ?? TextDirection.ltr,
        decoration: InputDecoration(
          // Label
          label: Text(
            label,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: theme.primary,
              fontSize: 20.0,
              fontVariations: const [FontVariation("wght", 500)],
            ),
          ),
          hintText: hintText,
          hintTextDirection: hintTextDirection ?? TextDirection.ltr,
          hintStyle: hintStyle ??
              TextStyle(
                color: theme.onSecondary,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
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
    );
  }
}
