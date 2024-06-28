// routes/app_routes.dart
import 'package:get/get.dart';
import 'package:marvel_app/app/view/character_list/character_list_binding.dart';
import 'package:marvel_app/app/view/character_list/character_list_page.dart';
import 'package:marvel_app/app/view/comics/comics_binding.dart';
import 'package:marvel_app/app/view/comics/comics_screen.dart';
import 'package:marvel_app/app/view/creators/creators_binding.dart';
import 'package:marvel_app/app/view/creators/creators_screen.dart';
import 'package:marvel_app/app/view/events/events_binding.dart';
import 'package:marvel_app/app/view/events/events_screen.dart';
import 'package:marvel_app/app/view/home/home_binding.dart';
import 'package:marvel_app/app/view/home/home_page.dart';
import 'package:marvel_app/app/view/onboarding/onboarding_binding.dart';
import 'package:marvel_app/app/view/onboarding/onboarding_page.dart';
import 'package:marvel_app/app/view/series/series_binding.dart';
import 'package:marvel_app/app/view/series/series_screen.dart';
import 'package:marvel_app/app/view/splash/splash_binding.dart';
import 'package:marvel_app/app/view/splash/splash_page.dart';
import 'package:marvel_app/app/view/stories/stories_binding.dart';
import 'package:marvel_app/app/view/stories/stories_screen.dart';


class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const comics = '/comics';
  static const creators = '/creators';
  static const events = '/events';
  static const series = '/series';
  static const stories = '/stories';
  static const character = '/characters';
  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: onboarding, page: () => OnboardingScreen(), binding: OnboardingBinding()),
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: comics, page: () => ComicsScreen(), binding: ComicsBinding()),
    GetPage(name: character, page: () => CharacterListPage(), binding: CharacterListBinding()),
    GetPage(name: creators, page: () => CreatorsScreen(), binding: CreatorsBinding()),
    GetPage(name: events, page: () => EventScreen(), binding: EventBinding()),
    GetPage(name: series, page: () => SeriesScreen(), binding: SeriesBinding()),
    GetPage(name: stories, page: () => StoriesScreen(), binding: StoriesBinding()),
  ];
}
