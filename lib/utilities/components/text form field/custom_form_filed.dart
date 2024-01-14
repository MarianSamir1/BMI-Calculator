import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class CustomTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? label;
  final String? error;
  final Color? textFormColor;
  final bool? obscureText;
  final String? suffixText;
  final bool? enabled;
  const CustomTextFormFeild({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.label,
    this.error,
    this.textFormColor,
    this.obscureText,
    this.suffixText,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: error == null
          ? null
          : (s) {
              if (s!.isEmpty) {
                return error;
              }
              return null;
            },
      obscureText: obscureText ?? false,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: ColorManager.lightGreyE0E0.withOpacity(0.5),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorManager.lightGreyE0E0.withOpacity(0.5),
          ), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorManager.lightGreyE0E0.withOpacity(0.5),
          ),
          //<-- SEE HERE
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorManager.red.withOpacity(0.5),
          ), //<-- SEE HERE
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorManager.red.withOpacity(0.5),
          ), //<-- SEE HERE
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.5.w),
        hintText: label,
        errorStyle: TextStyle(
          fontSize: FontManager.font12,
        ),
        suffixText: suffixText,
        hintStyle: TextStyle(
            color: ColorManager.grey828,
            fontSize: FontManager.font14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
