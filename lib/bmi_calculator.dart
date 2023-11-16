// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculator {
  double heightInCm = 175;
  double weightInKg = 75;
  int age = 25;
  late double _bmi;

  String calculate() {
    _bmi = weightInKg / pow(heightInCm / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  setWeight(double passedWeight) {
    weightInKg = passedWeight;
  }

  setHeight(double passedHeight) {
    heightInCm = passedHeight;
  }

  setAge(int passedAge) {
    age = passedAge;
  }

  String get weightStatus {
    if (_bmi < 18.5) {
      return "UnderWeight";
    } else if (18.5 <= _bmi && _bmi < 25) {
      return "Healthy Weight";
    } else if (25 <= _bmi && _bmi < 30) {
      return "OverWeight";
    } else {
      return "Obese";
    }
  }

  Color bmiColor() {
    if (_bmi < 18.5) {
      return Colors.orange.shade200;
    } else if (18.5 <= _bmi && _bmi < 25) {
      return Colors.green;
    } else if (25 <= _bmi && _bmi < 30) {
      return Colors.yellow.shade200;
    } else {
      return Colors.red;
    }
  }
}
