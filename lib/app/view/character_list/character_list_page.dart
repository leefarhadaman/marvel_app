// views/character_list/character_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'character_list_controller.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CharacterListController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Marvel Characters')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.characters[index].name),
              subtitle: Text(controller.characters[index].description),
            );
          },
        );
      }),
    );
  }
}
