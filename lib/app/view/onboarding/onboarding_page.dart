// views/onboarding/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.navigateToHome();
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}
