// views/splash/splash_controller.dart
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  RxDouble imageHeight = 0.0.obs;
  RxDouble imageWidth = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _navigateToOnboarding();
  }

  void setImageSize(BoxConstraints constraints) {
    imageHeight.value = constraints.maxHeight * 0.3;
    imageWidth.value = constraints.maxWidth * 0.6;
  }

  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 4));
    Get.offAllNamed(AppRoutes.onboarding);
  }
}
