// views/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Marvel Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.navigateToCharacterList();
          },
          child: Text('View Characters'),
        ),
      ),
    );
  }
}
