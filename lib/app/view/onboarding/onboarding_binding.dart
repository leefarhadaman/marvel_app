// views/onboarding/onboarding_binding.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/view/onboarding/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
