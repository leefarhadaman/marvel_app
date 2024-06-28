import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: [
          _buildOnboardingPage(
            context,
            'Welcome to the Marvel App',
            'Explore the Marvel Universe',
            'https://imgs.search.brave.com/rVxPaJRhd4SrBlUF6iIBUCjphvHPznB0_bGdP8kYJZg/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/d2FsbHBhcGVyc2Fm/YXJpLmNvbS80LzI1/L28wRFhUUS5qcGc',
          ),
          _buildOnboardingPage(
              context,
              'Discover Characters',
              'Find details about your favorite characters',
              'https://imgs.search.brave.com/qhIh9UgkertKgGfeRLHvsUfBubEkKZLkqRP9zVoNwNI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2UzLzFk/LzAzL2UzMWQwM2Q5/OTZkNDU2YmZmMDcy/N2JiNzRlZDU5Njk0/LmpwZw'
          ),
          _buildOnboardingPage(
            context,
            'Stay Updated',
            'Get the latest updates on Marvel events and series',
            'https://imgs.search.brave.com/pa4mkMDq-p9deRIiQg5pJp9vCishYcVkjjbQpRuZeOU/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2NjLzhh/LzAzL2NjOGEwMzI4/ZjhmNTQyYWNlZWQy/M2MzNGIwZDgyNmQ0/LmpwZw',
          ),
        ],
      ),
      bottomSheet: Obx(() => controller.isLastPage.value
          ? CustomButton(
        text: 'Get Started',
        onPressed: controller.navigateToHome,
      )
          : CustomButton(
        text: 'Next',
        onPressed: controller.nextPage,
      )),
    );
  }

  Widget _buildOnboardingPage(BuildContext context, String title, String subtitle, String imageUrl) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50), // Adjusts space for the button
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
