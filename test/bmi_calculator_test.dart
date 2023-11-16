import 'dart:math';

import 'package:bmi_calc/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BmiCalculator bmiCalculator;
  setUp(() {
    bmiCalculator = BmiCalculator();
  });
  group("bmi-calculator", () {
    test("instantiation", () {
      expect(bmiCalculator.age, 25);
      expect(bmiCalculator.heightInCm, 175);
      expect(bmiCalculator.weightInKg, 75);
    });
    test("field value change", () {
      bmiCalculator.setHeight(70);
      expect(bmiCalculator.heightInCm, 70);
      bmiCalculator.setWeight(70);
      expect(bmiCalculator.weightInKg, 70);
      bmiCalculator.setAge(70);
      expect(bmiCalculator.age, 70);
    });
    test("calculating the bmi", () {
      String bmi = bmiCalculator.calculate();
      String expected =
          (bmiCalculator.weightInKg / pow(bmiCalculator.heightInCm / 100, 2))
              .toStringAsFixed(2);
      expect(bmi, expected);
    });
    test("weight status", () {
      bmiCalculator.setHeight(175);
      bmiCalculator.setWeight(50);
      bmiCalculator.calculate();
      String expectedUW = "UnderWeight";
      expect(bmiCalculator.weightStatus, expectedUW);
      bmiCalculator.setWeight(75);
      bmiCalculator.calculate();
      String expectedHW = "Healthy Weight";
      expect(bmiCalculator.weightStatus, expectedHW);
      bmiCalculator.setWeight(85);
      bmiCalculator.calculate();
      String expectedOW = "OverWeight";
      expect(bmiCalculator.weightStatus, expectedOW);
      bmiCalculator.setWeight(175);
      bmiCalculator.calculate();
      String expectedOb = "Obese";
      expect(bmiCalculator.weightStatus, expectedOb);
    });
    test("weight status color", () {
      //color test for underweight
      bmiCalculator.setHeight(175);
      bmiCalculator.setWeight(50);
      bmiCalculator.calculate();
      Color expectedUWC = Colors.orange.shade200;
      expect(bmiCalculator.bmiColor(), expectedUWC);
      //color test for healthy weight
      bmiCalculator.setWeight(75);
      bmiCalculator.calculate();
      Color expectedHWC = Colors.green;
      expect(bmiCalculator.bmiColor(), expectedHWC);
      //color test for overweight
      bmiCalculator.setWeight(85);
      bmiCalculator.calculate();
      Color expectedOWC = Colors.yellow.shade200;
      expect(bmiCalculator.bmiColor(), expectedOWC);
      //color test for obese
      bmiCalculator.setWeight(175);
      bmiCalculator.calculate();
      Color expectedObC = Colors.red;
      expect(bmiCalculator.bmiColor(), expectedObC);
    });
  });
}
