import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/physical_health_tests.dart';
import '../../widgets/submit_button.dart';
import '../../widgets/test_text_field.dart';

class BloodSugerTestPage extends StatefulWidget {
  const BloodSugerTestPage({super.key});

  @override
  State<BloodSugerTestPage> createState() => _BloodSugerTestPageState();
}

class _BloodSugerTestPageState extends State<BloodSugerTestPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.secondary,
        elevation: 0.0,
        title: Text(
          "تست قند خون",
          style: TextStyle(
            color: theme.onBackground,
            fontSize: 25.0,
            fontVariations: const [FontVariation("wght", 700)],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: size.width * 0.6,
                child: TestTextField(
                  title: "سطح قند خون",
                  hintText: "110",
                  controller: controller,
                ),
              ),
            ),
            const SizedBox(height: 20),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.maxFinite,
      child: SubmitButton(
        label: "ثبت",
        onPressed: () {
          // for get numbers, i used regex it can validate without any error message
          // on textFormField
          if (RegExp(r"^[0-9.]+$").hasMatch(controller.text)) {
            // Dialog show the bmi resualt
            showDialog(
              context: context,
              builder: (context) {
                final result = PhysicalHealthTests.instance.bloodSugerTest(
                  bloodSuger: double.parse(controller.text),
                );

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bmi resualt
                      Text(
                        result.toString(),
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: theme.onBackground,
                          fontSize: 25.0,
                          fontVariations: const [FontVariation("wght", 700)],
                        ),
                      ),
                      // resualt title
                      Text(
                        "نتیجه",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: theme.onBackground,
                          fontSize: 25.0,
                          fontVariations: const [FontVariation("wght", 700)],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
