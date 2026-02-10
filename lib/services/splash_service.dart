import 'dart:async';
import 'package:flutter/material.dart';

class SplashService {
  void navigateToHome(BuildContext context, int seconds) {
    Timer(Duration(seconds: seconds), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
}
