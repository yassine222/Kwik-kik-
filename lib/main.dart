import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kwik_kik/pages/splash_screen_page.dart';
import 'package:kwik_kik/router/custom_router.dart';
import 'package:kwik_kik/theme/theme1.dart';

import '.env';
import 'classes/language_constants.dart';
import 'controller/auth_controller.dart';
import 'controller/goal_controller.dart';
import 'controller/profile_controller.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51LMFodLHZU3pYILTeiDUrHatKJjthFQjAC48Hqz1OzZfQQ42aQXXkHJlOIYLUpa1BMwKv1iD834o4PUE7yZMhuNh00pbK1WHqN';
  await Stripe.instance.applySettings();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    // Get.put(UserProfileController);
    Get.lazyPut(() => UserProfileController);
    Get.lazyPut(() => UserProfileController);
    Get.lazyPut(() => DocumentIdController);
  });

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool("is_dark") ?? false;
  seenOnboard = sharedPreferences.getBool('seenOnboard') ?? false;

  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(MyApp(
    isDark: isDark,
  ));
}

final navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  final bool isDark;
  const MyApp({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeSettings(widget.isDark),
        builder: (context, snapshot) {
          final settings = Provider.of<ThemeSettings>(context);
          return GetMaterialApp(
              title: 'Kwik kik',
              themeMode: settings.currentTheme,
              theme: ThemeSettings.lightTheme,
              darkTheme: ThemeSettings.darkTheme,
              navigatorKey: navigatorkey,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: CustomRouter.generatedRoute,
              locale: _locale,
              home: const SplashScreen());
        });
  }
}
