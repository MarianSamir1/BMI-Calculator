import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget bmiAppBar(BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const CustomText(text: "BMI Calculattion"),
      actions: [
        IconButton(
          onPressed: () {
            BMICalculationCubit.get(context).signOutFun();
          },
          icon: Icon(
            Icons.exit_to_app_rounded,
            size: 25.r,
            color: ColorManager.primaryColor,
          ),
        )
      ],
    );
