// Submit button

import 'dart:ui';

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enable = true,
  });

  final void Function()? onPressed;
  final String label;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          alignment: Alignment.center,
          backgroundColor: MaterialStatePropertyAll(
              enable ? theme.primary : theme.onSecondary),
          elevation: const MaterialStatePropertyAll(0.0),
        ),
        // Title
        child: Text(
          label,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontVariations: [FontVariation("wght", 600)],
          ),
        ),
      ),
    );
  }
}
