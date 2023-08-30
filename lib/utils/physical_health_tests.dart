import 'dart:math';

enum TestStatus {
  lessThanNormal,
  normal,
  unnormal,
  acceptable,
  aboveTheLimit;

  @override
  String toString() {
    switch (this) {
      case lessThanNormal:
        return 'LessThanNsormal';
      case normal:
        return 'Normal';
      case unnormal:
        return 'Unnormal';
      case acceptable:
        return 'Acceptable';
      case aboveTheLimit:
        return 'AboveTheLimit';
    }
  }
}

class PhysicalHealthTests {
  PhysicalHealthTests._();
  static final instance = PhysicalHealthTests._();

  /// It shows status of blood sugar test status with the [bloodSuger]
  /// Its return [TestStatus] for evaluation
  TestStatus bloodSugerTest({required double bloodSuger}) {
    if (bloodSuger < 70) {
      return TestStatus.lessThanNormal;
    } else if (bloodSuger <= 100) {
      return TestStatus.normal;
    } else if (bloodSuger > 100 && bloodSuger <= 125) {
      return TestStatus.acceptable;
    } else {
      return TestStatus.aboveTheLimit;
    }
  }

  /// It shows the hemoglobin test status with the [isMale] and [hemoglobin]
  /// [isMale] separates the test based on 2 metrics
  /// And [hemoglobin] shows the situation according to [isMale]
  /// Its return [TestStatus] for evaluation
  TestStatus hemoglobinTest({
    required bool isMale,
    required double hemoglobin,
  }) {
    switch (isMale) {
      case true:
        if (hemoglobin >= 13.5 && hemoglobin <= 18) {
          return TestStatus.normal;
        } else {
          return TestStatus.unnormal;
        }
      default:
        if (hemoglobin >= 12 && hemoglobin <= 16) {
          return TestStatus.normal;
        } else {
          return TestStatus.unnormal;
        }
    }
  }

  /// It shows the status of blood cells numbers test with the [isMale] and [bloodCellsNumbers]
  /// [isMale] separates the test based on 2 metrics
  /// And [bloodCellsNumbers] shows the situation according to [isMale]
  /// Its return [TestStatus] for evaluation
  TestStatus bloodCellsNumbersTest({
    required bool isMale,
    required double bloodCellsNumbers,
  }) {
    switch (isMale) {
      case true:
        if (bloodCellsNumbers >= 4.5 && bloodCellsNumbers <= 6.0) {
          return TestStatus.normal;
        } else {
          return TestStatus.unnormal;
        }
      default:
        if (bloodCellsNumbers >= 4.5 && bloodCellsNumbers <= 5.5) {
          return TestStatus.normal;
        } else {
          return TestStatus.unnormal;
        }
    }
  }

  /// It shows the status of blood promissory note test with the [bloodPromissoryNote]
  /// Its return [TestStatus] for evaluation
  TestStatus bloodPromissoryNoteTest({required double bloodPromissoryNote}) {
    if (bloodPromissoryNote >= 0.8 && bloodPromissoryNote <= 1.2) {
      return TestStatus.normal;
    } else {
      return TestStatus.unnormal;
    }
  }

  /// It shows the status of bmi test with the [wg] and [hg]
  /// Its return [TestStatus] for evaluation
  TestStatus bmiTest({
    required double wg,
    required double hg,
  }) {
    double result = 0;

    result = wg / (pow(hg, 2));
    result = double.parse(result.toStringAsFixed(2));

    if (result < 18.5) {
      return TestStatus.lessThanNormal;
    } else if (result >= 18.5 && result <= 24.99) {
      return TestStatus.normal;
    } else if (result >= 25.0 && result <= 29.99) {
      return TestStatus.acceptable;
    }
    return TestStatus.aboveTheLimit;
  }
}
