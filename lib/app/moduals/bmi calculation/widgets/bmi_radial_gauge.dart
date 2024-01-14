import 'package:bmi_calculation/utilities/components/other/custom_text.dart';
import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:bmi_calculation/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIRadialGauge extends StatelessWidget {
  final double bmi;

  const BMIRadialGauge({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 240.w,
        height: 240.h,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 40, // Adjust the maximum based on your BMI range
              ranges: <GaugeRange>[
                GaugeRange(
                  label: AppStrings.underweight,
                  startValue: 0,
                  endValue: 18.5,
                  color: Colors.blue,
                  startWidth: 20,
                  endWidth: 20,
                ),
                GaugeRange(
                  label: AppStrings.normal,
                  startValue: 18.6,
                  endValue: 24.9,
                  color: Colors.green,
                  startWidth: 20,
                  endWidth: 20,
                ),
                GaugeRange(
                  label: AppStrings.overweight,
                  startValue: 25,
                  endValue: 29.9,
                  color: Colors.yellow,
                  startWidth: 20,
                  endWidth: 20,
                ),
                GaugeRange(
                  label: AppStrings.obesity,
                  startValue: 30,
                  endValue: 40,
                  color: Colors.red,
                  startWidth: 20,
                  endWidth: 20,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: bmi,
                  needleLength: 0.7,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleStartWidth: 1,
                  needleEndWidth: 6,
                  knobStyle: KnobStyle(knobRadius: 0.08.r),
                  tailStyle: const TailStyle(length: 0.2),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: CustomText(
                    text: "BMI = ${bmi.toStringAsFixed(1)}",
                    fontSize: FontManager.font19,
                    fontWeight: FontWeight.bold,
                  ),
                  positionFactor: 0.9,
                  angle: 90,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
