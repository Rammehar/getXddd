import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_ddd_getx/auth/presentation/controllers/auth_controller.dart';

class SplashScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
