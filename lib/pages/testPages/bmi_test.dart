import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/physical_health_tests.dart';
import '../../widgets/submit_button.dart';
import '../../widgets/test_text_field.dart';

class BmiTestPage extends StatefulWidget {
  const BmiTestPage({super.key});

  @override
  State<BmiTestPage> createState() => _BmiTestPageState();
}

class _BmiTestPageState extends State<BmiTestPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  int radioValue = 1;
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.secondary,
        elevation: 0.0,
        title: Text(
          "‌BMI",
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
          children: <Widget>[
            // metric radion button
            metrics(theme),

            const SizedBox(height: 10.0),

            // height & weight textfields
            textFields(),

            const SizedBox(height: 20.0),

            submitButton(context),
          ],
        ),
      ),

      // Elevated button
    );
  }

  Widget textFields() {
    return Form(
      key: key,
      // TextFields
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // use Expanded for expand in display with flex 1
          Expanded(
            flex: 1,
            child: TestTextField(
              title: "وزن",
              hintText: "50",
              controller: weightController,
            ),
          ),
          const SizedBox(width: 20.0),
          // use Expanded for expand in display with flex 1
          Expanded(
            flex: 1,
            child: TestTextField(
              title: "قد",
              hintText: radioValue == 1 ? "1.88" : "188",
              controller: heightController,
            ),
          ),
        ],
      ),
    );
  }

  Widget metrics(ColorScheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // man radio
        Column(
          children: <Widget>[
            Text(
              "kg/m",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: theme.primary,
                fontSize: 22.0,
                fontVariations: const [FontVariation("wght", 500)],
              ),
            ),
            Radio(
              value: 1,
              groupValue: radioValue,
              onChanged: (value) {
                setState(() => radioValue = value!);
              },
            ),
          ],
        ),
        const SizedBox(width: 50.0),
        // woman radio
        Column(
          children: <Widget>[
            Text(
              "kg/cm",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: theme.primary,
                fontSize: 22.0,
                fontVariations: const [FontVariation("wght", 500)],
              ),
            ),
            Radio(
              value: 2,
              groupValue: radioValue,
              onChanged: (value) {
                setState(() => radioValue = value!);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.maxFinite,
      child: SubmitButton(
        label: "ثبت",
        onPressed: () {
          // for get numbers i used regex it can validate without any error message
          // on textFormField
          if (RegExp(r"^[0-9.]+$").hasMatch(weightController.text) &&
              RegExp(r"^[0-9.]+$").hasMatch(heightController.text)) {
            // Dialog show the bmi resualt
            showDialog(
              context: context,
              builder: (context) {
                final result;

                if (radioValue == 1) {
                  result = PhysicalHealthTests.instance.bmiTest(
                    wg: double.parse(weightController.text),
                    hg: double.parse(heightController.text),
                  );
                } else {
                  result = PhysicalHealthTests.instance.bmiTest(
                    wg: double.parse(weightController.text),
                    hg: double.parse(heightController.text) / 100,
                  );
                }

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                  title: Row(
                    children: [
                      // Bmi resualt
                      Text(
                        "نتیجه",
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
                          "$result(${humanReadableResult(result)})",
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: getResultColor(result),
                            fontSize: 20.0,
                            fontVariations: const [FontVariation("wght", 600)],
                          ),
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

Color getResultColor(TestStatus status) {
  switch (status) {
    case TestStatus.lessThanNormal:
      return Colors.red;
    case TestStatus.normal:
      return Colors.green;
    case TestStatus.acceptable:
      return Colors.orange;
    case TestStatus.aboveTheLimit:
      return Colors.red;
    default:
      return Colors.black;
  }
}

String humanReadableResult(TestStatus status) {
  switch (status) {
    case TestStatus.lessThanNormal:
      return "لاغر";
    case TestStatus.normal:
      return "متعادل";
    case TestStatus.acceptable:
      return "اضافه وزن";
    default:
      return "چاق";
  }
}
