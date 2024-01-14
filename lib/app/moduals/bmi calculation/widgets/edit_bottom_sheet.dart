import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/states.dart';
import 'package:bmi_calculation/utilities/components/buttons/custom_button.dart';
import 'package:bmi_calculation/utilities/components/other/circular_progress.dart';
import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:bmi_calculation/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'form_widget.dart';

editBottomSheet({required BuildContext context, required int index}) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(FontManager.font11),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SizedBox(
            height: 260.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: BMICalculationCubit.get(context).editFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        FormWidget(
                          textEditingController:
                              BMICalculationCubit.get(context)
                                  .heightEditController,
                          suffixText: AppStrings.cm,
                          title: AppStrings.height,
                        ),
                        SizedBox(width: 10.w),
                        FormWidget(
                          textEditingController:
                              BMICalculationCubit.get(context)
                                  .ageEditController,
                          title: AppStrings.age,
                          weight: 1.sw / 4,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    FormWidget(
                      textEditingController:
                          BMICalculationCubit.get(context).weightEditController,
                      suffixText: AppStrings.kg,
                      title: AppStrings.weight,
                    ),
                    SizedBox(height: 20.h),
                    BlocBuilder<BMICalculationCubit, BMICalculationState>(
                        builder: (context, state) {
                      if (state is UpdateSpecificLoadingState) {
                        return const CustomCircularProgressIndicator();
                      } else {
                        return CustomButton(
                          onTap: () {
                            if (BMICalculationCubit.get(context)
                                .editFormKey
                                .currentState!
                                .validate()) {
                              BMICalculationCubit.get(context)
                                  .updateSpecificEntryFun(
                                index: index,
                                context: context,
                              );
                            }
                          },
                          buttonText: "Save edit",
                        );
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
