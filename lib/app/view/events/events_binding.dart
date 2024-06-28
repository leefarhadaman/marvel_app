import 'package:get/get.dart';
import 'events_controller.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
  }
}
