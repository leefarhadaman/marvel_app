import 'package:get/get.dart';

import 'comics_controller.dart';

class ComicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicsController());
  }
}