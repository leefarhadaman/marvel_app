import 'package:get/get.dart';
import 'package:marvel_app/app/view/character_list/character_list_binding.dart';
import 'package:marvel_app/app/view/character_list/character_list_page.dart';
import 'package:marvel_app/app/view/home/home_binding.dart';
import 'package:marvel_app/app/view/home/home_page.dart';
import 'package:marvel_app/app/view/onboarding/onboarding_binding.dart';
import 'package:marvel_app/app/view/onboarding/onboarding_page.dart';
import 'package:marvel_app/app/view/splash/splash_binding.dart';
import 'package:marvel_app/app/view/splash/splash_page.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const CHARACTER_LIST = '/character_list';

  static final routes = [
    GetPage(name: SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: ONBOARDING, page: () => OnboardingPage(), binding: OnboardingBinding()),
    GetPage(name: HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: CHARACTER_LIST, page: () => CharacterListPage(), binding: CharacterListBinding()),
  ];
}
