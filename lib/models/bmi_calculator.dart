import 'dart:math';

double bmiCalculator({
  required double wg,
  required double hg,
}) {
  double value = 0;

  value = wg / (pow(hg, 2));
  value = double.parse(value.toStringAsFixed(2));

  return value;
}
