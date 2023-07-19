import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:physical_health/models/models.dart';

import 'package:physical_health/widgets/show_resault.dart';
import 'package:physical_health/widgets/submitButton.dart';
import 'package:physical_health/widgets/customTextField.dart';

class BloodTestPage extends StatefulWidget {
  const BloodTestPage({super.key});

  @override
  State<BloodTestPage> createState() => _BloodTestPageState();
}

class _BloodTestPageState extends State<BloodTestPage> {
  TextEditingController hemoglobinController = TextEditingController();
  TextEditingController bloodCellsNumbersController = TextEditingController();
  TextEditingController bloodPromissoryNoteController = TextEditingController();

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
          "تست خون",
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
            // male or female radio buttons
            metrics(theme),

            const SizedBox(height: 20.0),

            textFields(),

            const SizedBox(height: 20.0),

            submitButton(context),
          ],
        ),
      ),
    );
  }

  Row metrics(ColorScheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // man radio
        Column(
          children: <Widget>[
            Text(
              "مرد",
              textDirection: TextDirection.rtl,
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
              "زن",
              textDirection: TextDirection.rtl,
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

  Widget textFields() {
    return Column(
      children: [
        CustomTextField(
          controller: hemoglobinController,
          label: "هموگلبین",
          hintText: "14.0",
        ),
        const SizedBox(height: 10.0),
        // bloodPromissoryNote textField
        CustomTextField(
          controller: bloodPromissoryNoteController,
          label: "سفته خون",
          hintText: "1.0",
        ),
        const SizedBox(height: 10.0),
        // bloodCellsNumbers textField
        CustomTextField(
          controller: bloodCellsNumbersController,
          label: "تعداد سلول های خونی",
          hintText: "5.0",
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SubmitButton(
        label: "ثبت",
        onPressed: () {
          // for get numbers, i used regex it can validate without any error message
          // on textFormField
          if (RegExp(r"^[0-9.]+$").hasMatch(hemoglobinController.text) &&
              RegExp(r"^[0-9.]+$")
                  .hasMatch(bloodPromissoryNoteController.text) &&
              RegExp(r"^[0-9.]+$").hasMatch(bloodCellsNumbersController.text)) {
            // Dialog show the bmi resualt
            showDialog(
              context: context,
              builder: (context) {
                // get instance from blood test class
                BloodTest bloodTest = BloodTest(
                  isMale: radioValue == 1 ? true : false,
                  hemoglobin: double.parse(hemoglobinController.text),
                  bloodCellsNumbers:
                      double.parse(bloodCellsNumbersController.text),
                  bloodPromissoryNote:
                      double.parse(bloodPromissoryNoteController.text),
                );

                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                  title: Column(
                    children: [
                      ShowResualt(
                        title: "هموگلبین",
                        resualt: bloodTest.hemoglobinTest,
                      ),
                      ShowResualt(
                        title: "سفته خون",
                        resualt: bloodTest.bloodPromissoryNoteTest,
                      ),
                      ShowResualt(
                        title: "تعداد سلول های خونی",
                        resualt: bloodTest.bloodCellsNumbersTest,
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
