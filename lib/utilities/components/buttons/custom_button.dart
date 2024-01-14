import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../other/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const CustomButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(50.r),
          // border: Border.all(color: ColorManager.primaryColor),
        ),
        child: CustomText(
          text: buttonText,
          textAlign: TextAlign.center,
          color: ColorManager.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final Widget widget;
  final Function()? onTap;
  const CustomButton2({super.key, required this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(50.r),
          // border: Border.all(color: ColorManager.primaryColor),
        ),
        child: widget,
      ),
    );
  }
}
