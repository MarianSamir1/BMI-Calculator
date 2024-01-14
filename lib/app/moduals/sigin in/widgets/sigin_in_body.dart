import 'package:bmi_calculation/app/moduals/sigin%20in/widgets/sigin_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bmi_calculation/utilities/constants/images_pathes.dart';

class SiginInBody extends StatelessWidget {
  const SiginInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagesPaths.fitnessLogo),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //=============== SiginIn Button ===============
                SiginInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
