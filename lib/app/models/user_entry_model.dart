import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntryModel {
  String? age;
  String? height;
  String? weight;
  String? bmiValue;
  String? bmiStatus;
  DateTime? currentDate;

  UserEntryModel({
    this.age,
    this.height,
    this.weight,
    this.bmiValue,
    this.bmiStatus,
    this.currentDate,
  });
  UserEntryModel.fromJson(Map<String, dynamic> json) {
    age =
        json['age'] == null ? AppStrings.notAvailable : json['age'].toString();
    height = json['height'] == null
        ? AppStrings.notAvailable
        : json['height'].toString();
    weight = json['weight'] == null
        ? AppStrings.notAvailable
        : json['weight'].toString();
    bmiValue = json['bmi_value'] == null
        ? AppStrings.notAvailable
        : json['bmi_value'].toString();
    bmiStatus = json['bmi_status'] == null
        ? AppStrings.notAvailable
        : json['bmi_status'].toString();
    currentDate = json['current_date'].toDate();
  }
  Map<String, dynamic> toJson() => {
        'age': age,
        'height': height,
        "weight": weight,
        "bmi_value": bmiValue,
        "bmi_status": bmiStatus,
        if (currentDate != null)
          "current_date": Timestamp.fromDate(currentDate!),
      };
}
