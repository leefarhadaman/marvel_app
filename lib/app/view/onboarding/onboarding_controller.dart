// views/onboarding/onboarding_controller.dart
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  void navigateToHome() {
    Get.offNamed('/home');
  }
}
