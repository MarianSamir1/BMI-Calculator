import 'package:bmi_calculation/app/data/user_entry_data.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/states.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/widgets/bmi_app_bar.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/widgets/bmi_form.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/widgets/user_entries_list.dart';
import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:bmi_calculation/utilities/styles/colors.dart';
import 'package:bmi_calculation/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bmi_radial_gauge.dart';

class BMiCalculationScreen extends StatelessWidget {
  const BMiCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bmiAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //========================== BMI Form Widget ================
              const BMIFormWidget(),
              //========================== BMI Radial Gauge ================
              BlocBuilder<BMICalculationCubit, BMICalculationState>(
                builder: (context, state) =>
                    BMIRadialGauge(bmi: BMICalculationCubit.get(context).bmi),
              ),
              //========================== user entries list ================
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: AppStrings.theUserEntries,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {
                      UserData.deleteAllEntries();
                    },
                    child: CustomText(
                      text: AppStrings.deleteAll,
                      fontSize: FontManager.font14,
                      color: ColorManager.red,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              const UserEntriesList()
            ],
          ),
        ),
      ),
    );
  }
}
