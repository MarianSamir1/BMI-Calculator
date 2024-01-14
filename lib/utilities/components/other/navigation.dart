import 'package:flutter/material.dart';

navigatePush({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

navigatePushReplacement({required context, required widget}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));

navigatepushAndRemoveUntil({required context, required widget}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route)=> false
    );
