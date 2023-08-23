import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import 'about_us_page.dart';
import 'testPages/blood_suger_test.dart';
import 'testPages/blood_test.dart';
import 'testPages/bmi_test.dart';
import 'testPages/suggestions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final NavigatorState navigator = Navigator.of(context);

    return Scaffold(
      backgroundColor: theme.background,
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.secondary,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            navigator.push(
              PageTransition(
                child: const AboutUsPage(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          icon: const Icon(Icons.info),
        ),
        // Title
        title: Text(
          "سلامت جسمانی",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: theme.onBackground,
              fontSize: 25.0,
              fontVariations: const [FontVariation("wght", 700)]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          child: GridView(
            primary: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            children: <Widget>[
              // Bmi test
              TestGridItem(
                onTap: () {
                  navigator.push(
                    PageTransition(
                      child: const BmiTestPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                title: "‌‌BMI",
                imageURL: "assets/svgs/bmi.svg",
              ),
              // Blood suger test
              TestGridItem(
                onTap: () {
                  navigator.push(
                    PageTransition(
                      child: const BloodSugerTestPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                title: "تست قند خون",
                imageURL: "assets/svgs/bloodSuger.svg",
              ),
              // Blood test
              TestGridItem(
                onTap: () {
                  navigator.push(
                    PageTransition(
                      child: const BloodTestPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                title: "تست خون",
                imageURL: "assets/svgs/blood.svg",
              ),
              // Ear test
              TestGridItem(
                onTap: () {
                  navigator.push(
                    PageTransition(
                      child: const SuggestionsPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                title: "توصیه ها",
                imageURL: "assets/svgs/suggestions.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestGridItem extends StatelessWidget {
  final void Function()? onTap;
  final String title, imageURL;

  const TestGridItem({
    super.key,
    required this.title,
    required this.imageURL,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.secondary,
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.center,
        // Image and title
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // image
            SvgPicture.asset(
              imageURL,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(height: 20.0),
            // title
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: theme.primary,
                fontSize: 25.0,
                fontVariations: const [FontVariation("wght", 500)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
