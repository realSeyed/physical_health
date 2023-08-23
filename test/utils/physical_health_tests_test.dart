import 'package:flutter_test/flutter_test.dart';
import 'package:physical_health/utils/physical_health_tests.dart';

void main() {
  group(
    "PhysicalHealthTests",
    () {
      late PhysicalHealthTests tests;

      setUpAll(() {
        tests = PhysicalHealthTests.instance;
      });
      group(
        "bloodSugerTest",
        () {
          test(
            "should return TestStatus.lessThanNormal",
            () {
              // arrange
              // act
              final result = tests.bloodSugerTest(bloodSuger: 68.0);
              // assert
              expect(result, TestStatus.lessThanNormal);
            },
          );
          test("should return TestStatus.normal", () {
            // arrange
            // act
            final result = tests.bloodSugerTest(bloodSuger: 78.0);
            // assert
            expect(result, TestStatus.normal);
          });
          test("should return TestStatus.acceptable", () {
            // arrange
            // act
            final result = tests.bloodSugerTest(bloodSuger: 101.0);
            // assert
            expect(result, TestStatus.acceptable);
          });
          test("should return TestStatus.aboveTheLimit", () {
            // arrange
            // act
            final result = tests.bloodSugerTest(bloodSuger: 126.0);
            // assert
            expect(result, TestStatus.aboveTheLimit);
          });
        },
      );
      group(
        "hemoglobinTest",
        () {
          group(
            "male -",
            () {
              test(
                "should return TestStatus.normal",
                () {
                  // arrange
                  // act
                  final result = tests.hemoglobinTest(
                    isMale: true,
                    hemoglobin: 14.0,
                  );
                  // assert
                  expect(result, TestStatus.normal);
                },
              );
              test(
                "should return TestStatus.unnnormal",
                () {
                  // arrange
                  // act
                  final result = tests.hemoglobinTest(
                    isMale: true,
                    hemoglobin: 19.0,
                  );
                  // assert
                  expect(result, TestStatus.unnormal);
                },
              );
            },
          );
          group(
            "female -",
            () {
              test(
                "should return TestStatus.normal",
                () {
                  // arrange
                  // act
                  final result = tests.hemoglobinTest(
                    isMale: false,
                    hemoglobin: 13.0,
                  );
                  // assert
                  expect(result, TestStatus.normal);
                },
              );
              test(
                "should return TestStatus.unnnormal",
                () {
                  // arrange
                  // act
                  final result = tests.hemoglobinTest(
                    isMale: false,
                    hemoglobin: 17.0,
                  );
                  // assert
                  expect(result, TestStatus.unnormal);
                },
              );
            },
          );
        },
      );
      group(
        "bloodCellsNumbersTest",
        () {
          group(
            "male -",
            () {
              test(
                "should return TestStatus.normal",
                () {
                  // arrange
                  // act
                  final result = tests.bloodCellsNumbersTest(
                    isMale: true,
                    bloodCellsNumbers: 5.0,
                  );
                  // assert
                  expect(result, TestStatus.normal);
                },
              );
              test(
                "should return TestStatus.unnnormal",
                () {
                  // arrange
                  // act
                  final result = tests.bloodCellsNumbersTest(
                    isMale: true,
                    bloodCellsNumbers: 7.0,
                  );
                  // assert
                  expect(result, TestStatus.unnormal);
                },
              );
            },
          );
          group(
            "female -",
            () {
              test(
                "should return TestStatus.normal",
                () {
                  // arrange
                  // act
                  final result = tests.bloodCellsNumbersTest(
                    isMale: false,
                    bloodCellsNumbers: 5.0,
                  );
                  // assert
                  expect(result, TestStatus.normal);
                },
              );
              test(
                "should return TestStatus.unnnormal",
                () {
                  // arrange
                  // act
                  final result = tests.bloodCellsNumbersTest(
                    isMale: false,
                    bloodCellsNumbers: 5.6,
                  );
                  // assert
                  expect(result, TestStatus.unnormal);
                },
              );
            },
          );
        },
      );
      group(
        "bloodPromissoryNoteTest",
        () {
          test(
            "should return TestStatus.normal",
            () {
              // arrange
              // act
              final result = tests.bloodPromissoryNoteTest(
                bloodPromissoryNote: 1.0,
              );
              //assert
              expect(result, TestStatus.normal);
            },
          );
          test(
            "should return TestStatus.unnormal",
            () {
              // arrange
              // act
              final result = tests.bloodPromissoryNoteTest(
                bloodPromissoryNote: 0.7,
              );
              //assert
              expect(result, TestStatus.unnormal);
            },
          );
        },
      );
      group(
        "bmiTest",
        () {
          test(
            "should return TestStatus.lessThanNormal",
            () {
              // arrange
              // act
              final result = tests.bmiTest(wg: 10, hg: 1.63);
              // assert
              expect(result, TestStatus.lessThanNormal);
            },
          );
          test(
            "should return TestStatus.normal",
            () {
              // arrange
              // act
              final result = tests.bmiTest(wg: 65, hg: 1.63);
              // assert
              expect(result, TestStatus.normal);
            },
          );
          test(
            "should return TestStatus.acceptable",
            () {
              // arrange
              // act
              final result = tests.bmiTest(wg: 75, hg: 1.63);
              // assert
              expect(result, TestStatus.acceptable);
            },
          );
          test(
            "should return TestStatus.aboveTheLimit",
            () {
              // arrange
              // act
              final result = tests.bmiTest(wg: 100, hg: 1.63);
              // assert
              expect(result, TestStatus.aboveTheLimit);
            },
          );
        },
      );
    },
  );
}
