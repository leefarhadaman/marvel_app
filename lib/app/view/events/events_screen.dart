// views/events/event_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/event_card.dart';
import 'events_controller.dart';


class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Events',style: TextStyle(color: Colors.white),
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
        padding: EdgeInsets.all(0.8),
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
            return ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (context, index) {
                return EventCard(event: controller.events[index]);
              },
            );
          }
        }),
      ),
    );
  }
}
