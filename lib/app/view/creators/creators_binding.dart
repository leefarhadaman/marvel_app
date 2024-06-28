import 'package:get/get.dart';

import 'creators_controller.dart';

class CreatorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorsController());
  }
}