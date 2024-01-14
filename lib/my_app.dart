import 'package:bmi_calculation/app/moduals/bmi%20calculation/controller/cubit.dart';
import 'package:bmi_calculation/app/moduals/sigin%20in/controller/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth_wrapper.dart';
import 'utilities/constants/global_constants.dart';
import 'utilities/styles/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BMICalculationCubit(),
        ),
        BlocProvider(
          create: (context) => SiginInCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 818),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navKey,
            title: 'BMI Calculation',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: ColorManager.primaryColor,
              ),
              useMaterial3: false,
            ),
            debugShowCheckedModeBanner: false,
            home: const AuthWrapper(),
          );
        },
      ),
    );
  }
}
