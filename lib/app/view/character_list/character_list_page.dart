import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/widget/character_card.dart';
import 'character_list_controller.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CharacterListController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel Characters',style: TextStyle(color:Colors.white),),
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
          }
          if (controller.characters.isEmpty) {
            return Center(child: Text('No characters found.'));
          }
          return GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.characters.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: controller.characters[index]);
            },
          );
        }),
      ),
    );
  }
}
