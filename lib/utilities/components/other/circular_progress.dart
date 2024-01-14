import 'package:bmi_calculation/utilities/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircularProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 25.w,
      child: CircularProgressIndicator(
        color: color ?? ColorManager.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
