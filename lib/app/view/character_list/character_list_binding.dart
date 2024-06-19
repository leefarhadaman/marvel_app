// views/character_list/character_list_binding.dart
import 'package:get/get.dart';
import 'character_list_controller.dart';

class CharacterListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterListController>(() => CharacterListController());
  }
}
