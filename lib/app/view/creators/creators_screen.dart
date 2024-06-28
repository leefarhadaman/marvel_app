import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/widget/creator_card.dart';
import 'creators_controller.dart';

class CreatorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreatorsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Creators',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // Dark color at the top
              Color(0xFF1C1C1C), // Slightly lighter color at the bottom
            ],
          ),
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error.value != null) {
            return Center(child: Text('Error: ${controller.error.value}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: controller.creators.length,
              itemBuilder: (context, index) {
                return CreatorCard(creator: controller.creators[index]);
              },
            );
          }
        }),
      ),
    );
  }
}
