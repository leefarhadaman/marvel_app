import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/widget/comic_card.dart';
import 'comics_controller.dart';

class ComicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ComicsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Comics',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,color: Colors.white,),
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
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.comics.length,
              itemBuilder: (context, index) {
                return ComicCard(comic: controller.comics[index]);
              },
            );
          }
        }),
      ),
    );
  }
}
