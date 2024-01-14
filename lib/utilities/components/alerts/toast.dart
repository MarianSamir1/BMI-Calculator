import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../styles/colors.dart';
import '../../styles/fonts.dart';

void showToast({required String msg, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: ColorManager.white,
      fontSize: FontManager.font16.sp,
    );

//enum
// ignore: constant_identifier_names
enum ToastStates { SUCCRSS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCRSS:
      color = ColorManager.green;
      break;
    case ToastStates.ERROR:
      color = ColorManager.red;
      break;
    case ToastStates.WARNING:
      color = ColorManager.yallow;
      break;
  }
  return color;
}
