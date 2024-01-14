import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/utilities/components/buttons/custom_button.dart';
import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/components/text%20form%20field/custom_form_filed.dart';
import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'form_widget.dart';

class BMIFormWidget extends StatelessWidget {
  const BMIFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BMICalculationCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FormWidget(
                textEditingController: cubit.heightController,
                suffixText: AppStrings.cm,
                title: AppStrings.height,
              ),
              SizedBox(width: 20.w),
              const CustomText(
                text: AppStrings.age,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomTextFormFeild(
                  controller: cubit.ageController,
                  keyboardType: TextInputType.number,
                  error: AppStrings.requirdField,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          FormWidget(
            textEditingController: cubit.weightController,
            suffixText: AppStrings.kg,
            title: AppStrings.weight,
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
              onTap: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.calculateBMIFun();
                }
              },
              buttonText: AppStrings.calculateBMI,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
