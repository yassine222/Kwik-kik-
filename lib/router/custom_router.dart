import 'package:flutter/material.dart';
import 'package:kwik_kik/pages/about_page.dart';
import 'package:kwik_kik/pages/home_page.dart';
import 'package:kwik_kik/pages/home_page2.dart';
import 'package:kwik_kik/pages/not_found_page.dart';
import 'package:kwik_kik/pages/onboarding_page.dart';
import 'package:kwik_kik/pages/pages.dart';
import 'package:kwik_kik/pages/profile_page.dart';
import 'package:kwik_kik/pages/reminder/reminders.dart';
import 'package:kwik_kik/pages/settings_page.dart';

import 'package:kwik_kik/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage2());
      case profilePageRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case onBoardingPageRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case reminderPageRoute:
        return MaterialPageRoute(builder: (_) => const RemindersList());
      case signupPageRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
