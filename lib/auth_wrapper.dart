import 'dart:developer';
import 'package:bmi_calculation/app/data/firebase_instances.dart';
import 'package:bmi_calculation/app/moduals/bmi%20calculation/view/bmi_calculation_screen.dart';
import 'package:bmi_calculation/app/moduals/sigin%20in/view/sigin_in_screen.dart';
import 'package:bmi_calculation/utilities/components/other/circular_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseInstance.firebaseAuth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator or splash screen can be displayed while waiting for the auth state
          return const CustomCircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            // User is signed in
            log('User signed in with UID: ${snapshot.data!.uid}');
            return const BMiCalculationScreen();
          } else {
            // User is signed out
            log('User signed out');
            return const SiginInScreen();
          }
        }
      },
    );
  }
}
