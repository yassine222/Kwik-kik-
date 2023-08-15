import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwik_kik/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../pages/authentication/login_page.dart';
import '../pages/main_page.dart';

class AuthController extends GetxController {
  //AuthController.intsance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    seenOnboard = sharedPreferences.getBool('seenOnboard') ?? false;

    if (user == null && seenOnboard == true) {
      print("login page");
      Get.offAll(() => const LoginPage());
    } else if (user == null && seenOnboard == false) {
      Get.offAll(() => const OnBoardingPage());
    } else {
      Get.offAll(() => const MainScreen());
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      auth.currentUser!.sendEmailVerification();
      Get.snackbar("About Email Verification", "Email message",
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Email Verification sent!",
            style: TextStyle(color: Colors.white),
          ),
          messageText: const Text("Check your eamil to verify",
              style: TextStyle(color: Colors.white)));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("About Email Verification", "Email message",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Email Verification failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void register(BuildContext context, String email, password) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ),
    );
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              sendEmailVerification(context).then((value) => logOut()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("About User", "User message",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }

  void login(BuildContext context, String email, password) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ),
    );
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (!auth.currentUser!.emailVerified) {
          Get.snackbar(
            "About Login",
            "Login message",
            icon: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            backgroundColor: Colors.cyan,
            snackPosition: SnackPosition.BOTTOM,
            titleText: const Text(
              "Login failed",
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              "email not verified",
              style: const TextStyle(color: Colors.white),
            ),
          );

          Get.offAll(LoginPage());
          logOut();
        }
      });
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.cyan,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }

  void logOut() async {
    await auth.signOut();
  }

  void resetPassword(BuildContext context, String email) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Required", "Password Reset email sent !",
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("About Reset Password", "Reset Password message",
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          titleText: const Text(
            "Reset Password failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }

  void signInWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ),
    );
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
              await auth.signInWithCredential(credential);

          // if you want to do specific task like storing information in firestore
          // only for new users using google sign in (since there are no two options
          // for google sign in and google sign up, only one as of now),
          // do the following:

          // if (userCredential.user != null) {
          //   if (userCredential.additionalUserInfo!.isNewUser) {}
          // }
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("About Google Sign In", "Google Sign In message",
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          titleText: const Text(
            "Google Sign In failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }

  void signInWithFacebook(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.cyan,
        ),
      ),
    );
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      AccessToken? accessToken = loginResult.accessToken;
      if (accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);
        await auth.signInWithCredential(facebookAuthCredential);
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        Get.snackbar("About Facebook Sign In", "Facebook Sign In message",
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ),
            titleText: const Text(
              "Facebook Sign In failed",
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              "Facebook SignIn is not available at the moment",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.cyan,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        navigatorkey.currentState!.popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("About Facebook Sign In", "Facebook Sign In message",
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          titleText: const Text(
            "Facebook Sign In failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
          snackPosition: SnackPosition.BOTTOM);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }
}
