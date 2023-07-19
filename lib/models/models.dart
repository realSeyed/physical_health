// BloodSugerTest
class BloodSugerTest {
  double bloodSuger;
  BloodSugerTest({required this.bloodSuger});

  String get bloodSugerTest {
    if (bloodSuger < 70)
      return "lessThanNormal";
    else if (bloodSuger <= 100)
      return "normal";
    else if (bloodSuger > 100 && bloodSuger <= 125)
      return "acceptable";
    else if (bloodSuger > 125)
      return "aboveTheLimit";
    else
      throw "error";
  }
}

// Blood test
class BloodTest {
  bool isMale;
  double hemoglobin;
  double bloodPromissoryNote;
  double bloodCellsNumbers;

  BloodTest({
    required this.isMale,
    required this.hemoglobin,
    required this.bloodCellsNumbers,
    required this.bloodPromissoryNote,
  });

  String get hemoglobinTest {
    switch (isMale) {
      case true:
        if (hemoglobin >= 13.5 && hemoglobin <= 18)
          return "noraml";
        else
          return "unnormal";
      case false:
        if (hemoglobin >= 12 && hemoglobin <= 16)
          return "normal";
        else
          return "unnormal";
    }
    throw "error";
  }

  String get bloodPromissoryNoteTest {
    if (bloodPromissoryNote >= 0.8 && bloodPromissoryNote <= 1.2)
      return "normal";
    else
      return "unnormal";
  }

  String get bloodCellsNumbersTest {
    switch (isMale) {
      case true:
        if (bloodCellsNumbers >= 4.5 && bloodCellsNumbers <= 6.0)
          return "normal";
        else
          return "unnormal";

      case false:
        if (bloodCellsNumbers >= 4.5 && bloodCellsNumbers <= 5.5)
          return "noraml";
        else
          return "unnormal";
    }
    throw "error";
  }
}
