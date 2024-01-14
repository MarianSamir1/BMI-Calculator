import 'package:bloc/bloc.dart';
import 'package:bmi_calculation/network/shared_preferences/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'network/bloc_observer/bloc_observer.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  ChachHelper.init();
  runApp(const MyApp());
}
