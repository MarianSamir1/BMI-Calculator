import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final double? spacing;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.fontWeight,
    this.spacing,
    this.color = ColorManager.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize?.sp ?? FontManager.font16.sp,
        color: color,
        height: spacing,
        fontWeight: fontWeight,
      ),
    );
  }
}
