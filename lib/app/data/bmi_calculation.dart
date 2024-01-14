import 'dart:math';

import 'package:bmi_calculation/utilities/constants/app_strings.dart';

class BMICalculationData {
  //==================== calculate BMI ======================
  static double calculateBMI({
    required double height,
    required double weight,
  }) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  //=================== BMI Status ==========================
  static String getBMIStatus({required double bmi}) {
    if (bmi <= 18.5) {
      return AppStrings.underweight;
    } else if (bmi >= 18.6 && bmi <= 24.9) {
      return AppStrings.normal;
    } else if (bmi >= 25 && bmi <= 29.9) {
      return AppStrings.overweight;
    } else {
      return AppStrings.obesity;
    }
  }
}
