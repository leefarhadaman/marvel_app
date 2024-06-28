// views/onboarding/onboarding_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var isLastPage = false.obs;

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    pageController.addListener(() {
      isLastPage.value = (pageController.page == 2);
    });
    super.onInit();
  }
}
