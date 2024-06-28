// views/series/series_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/widget/series_card.dart';
import 'series_controller.dart';

class SeriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SeriesController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Series',style: TextStyle(color:Colors.white),),
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
        padding: EdgeInsets.all(2),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error.value != null) {
            return Center(child: Text('Error: ${controller.error.value}'));
          } else {
            return ListView.builder(
              itemCount: controller.series.length,
              itemBuilder: (context, index) {
                return SeriesCard(series: controller.series[index]);
              },
            );
          }
        }),
      ),
    );
  }
}
