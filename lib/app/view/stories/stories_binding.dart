// views/stories/stories_binding.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/view/stories/stories_controller.dart';

class StoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoriesController());
  }
}
