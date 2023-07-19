import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:physical_health/widgets/developer_info.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "درباره ما",
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 700)],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              DeveloperInfo(
                imagePath: "assets/images/sm.jpg",
                name: "محمد حسین موسوی",
                description: "توسعه دهنده موبایل",
              ),
              SizedBox(height: 20.0),
              DeveloperInfo(
                imagePath: "assets/images/nm.jpg",
                name: "نیما شادلو",
                description: "توسعه دهنده بک اند و رابط کاربری",
              )
            ],
          ),
        ),
      ),
    );
  }
}
