import 'package:flutter/material.dart';
import '../services/splash_service.dart';
import '../models/splash_model.dart';

class SplashController {
  final SplashService _service = SplashService();
  final SplashModel _model = SplashModel(duration: 5);

  void startSplash(BuildContext context) {
    _service.navigateToHome(context, _model.duration);
  }

  int get duration => _model.duration;
}
