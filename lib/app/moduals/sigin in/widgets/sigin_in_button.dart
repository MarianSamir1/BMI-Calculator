import 'package:bmi_calculation/app/moduals/sigin%20in/controller/cubit.dart';
import 'package:bmi_calculation/app/moduals/sigin%20in/controller/states.dart';
import 'package:bmi_calculation/utilities/components/buttons/custom_button.dart';
import 'package:bmi_calculation/utilities/components/other/circular_progress.dart';
import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiginInButton extends StatelessWidget {
  const SiginInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiginInCubit, SinginInState>(builder: (context, state) {
      if (state is SignInAnonymouslyLoadingState &&
          SiginInCubit.get(context).signInAnonymouslyResponce == null) {
        //sigin_in loading
        return const CustomCircularProgressIndicator();
      } else {
        //sigin_in success
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: CustomButton(
              buttonText: AppStrings.siginIn,
              onTap: () {
                SiginInCubit.get(context).signInAnonymouslyFun();
              },
            ),
          ),
        );
      }
    });
  }
}
