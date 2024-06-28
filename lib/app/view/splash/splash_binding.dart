// views/splash/splash_binding.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/view/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
