import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:greengrocer/src/pages/auth/view/SingnInScreen.dart';
import 'package:greengrocer/src/pages/auth/view/signUpScreen.dart';
import 'package:greengrocer/src/pages/auth/view/signUpScreen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoute.splashRoute,
    ),
    GetPage(
      page: () =>  SingInScreen(),
      name: PagesRoute.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoute.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoute.baseRoute,
    ),
  ];
}

abstract class PagesRoute {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
