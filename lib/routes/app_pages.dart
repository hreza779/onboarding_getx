import 'package:get/get.dart';
import 'package:onboarding_getx/screens/intro_screen.dart';

part 'app_routes.dart';
class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.INTRO,
        page: () => const IntroScreen(),
        transition: Transition.fadeIn),

  ];
}