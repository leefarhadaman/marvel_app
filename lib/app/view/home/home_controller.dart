// views/home/home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  void navigateToCharacterList() {
    Get.toNamed('/character_list');
  }
}
