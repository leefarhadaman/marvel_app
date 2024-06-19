import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:marvel_app/app/routes/app_routes.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
    print('PUBLIC_KEY: ${dotenv.env['PUBLIC_KEY']}'); // Debug print
    print('PRIVATE_KEY: ${dotenv.env['PRIVATE_KEY']}'); // Debug print
  } catch (e) {
    print('Error loading .env file: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppRoutes.routes,
    );
  }
}
