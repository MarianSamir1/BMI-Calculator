import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/components/text%20form%20field/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilities/constants/app_strings.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String? suffixText;
  final double? weight;
  const FormWidget(
      {super.key,
      required this.textEditingController,
      this.suffixText,
      required this.title,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: weight ?? 1.sw / 3,
          child: CustomTextFormFeild(
            controller: textEditingController,
            keyboardType: TextInputType.number,
            suffixText: suffixText,
            error: AppStrings.requirdField,
          ),
        ),
      ],
    );
  }
}
