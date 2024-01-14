import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  final String svgImage;
  final double? height;
  final double? width;
  final Color? color;
  const CustomSvgPicture(
      {super.key, required this.svgImage, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgImage,
      color: color,
      height: height?.r,
      width: width?.r,
    );
  }
}
