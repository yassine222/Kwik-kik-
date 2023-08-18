import 'package:flutter/material.dart';
import 'package:kwik_kik/pages/home_page2.dart';
import 'package:kwik_kik/pages/main_page.dart';
import 'package:kwik_kik/pages/not_found_page.dart';
import 'package:kwik_kik/pages/pages.dart';
import 'package:kwik_kik/pages/profile_page.dart';
import 'package:kwik_kik/pages/settings_page.dart';
import 'package:kwik_kik/pages/splash_screen_page.dart';

import 'package:kwik_kik/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage2());
      case mainScreenPageRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case profilePageRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case onBoardingPageRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case signupPageRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());

      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
