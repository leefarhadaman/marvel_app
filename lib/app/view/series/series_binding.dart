// views/series/series_binding.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/view/series/series_controller.dart';

class SeriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeriesController());
  }
}
