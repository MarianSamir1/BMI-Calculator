import 'dart:async';
import 'dart:developer';
import 'package:bmi_calculation/app/data/firebase_instances.dart';
import 'package:bmi_calculation/app/models/response_handler_model.dart';
import 'package:bmi_calculation/network/shared_preferences/cash_helper.dart';
import 'package:bmi_calculation/utilities/components/alerts/toast.dart';
import 'package:bmi_calculation/utilities/constants/chash_keys.dart';
// import 'package:bmi_calculation/utilities/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  static Future<ResponseHandlerClass> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseInstance.firebaseAuth.signInAnonymously();
      // User is signed in
      User user = userCredential.user!;
      log('Signed in anonymously with UID: ${user.uid}');
      ChachHelper.saveData(key: CasheKeys.uid, value: user.uid);
      return ResponseHandlerClass(
        errorFlag: false,
      );
    } catch (e) {
      log(' ========== signInAnonymously throw Exeption : $e ==========');
      return ResponseHandlerClass(
        errorFlag: true,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<bool> signOut() async {
    try {
      await FirebaseInstance.firebaseAuth.signOut();
      ChachHelper.clearData();
      log('Signed out');
      return true;
    } catch (e) {
      showToast(msg: e.toString(), state: ToastStates.ERROR);
      return false;
    }
  }
}
