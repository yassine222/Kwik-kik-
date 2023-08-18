import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kwik_kik/controller/auth_controller.dart';
import 'package:kwik_kik/pages/add_goal_page.dart';
import 'package:kwik_kik/pages/create_profile.dart';
import 'package:kwik_kik/pages/home_page2.dart';
import 'package:kwik_kik/pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage2(),
    const AddGoalPage(),
    ProfilePage()
  ];
  Stream<bool> isProfileSet(String userId) {
    // Get the reference to the user's document in the UserProfile collection
    final userProfileRef =
        FirebaseFirestore.instance.collection('userProfile').doc(userId);

    // Create a stream of snapshots of the user's document
    return userProfileRef.snapshots().map((snapshot) {
      // Check if the snapshot contains any data
      if (!snapshot.exists) {
        // If the document does not exist, assume the user is not banned
        return false;
      }

      // Get the value of the isBanned field from the snapshot
      final isSet = snapshot['isProfileSet'];

      // Return the value of the isBanned field
      return isSet;
    });
  }

  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: isProfileSet(AuthController.instance.auth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            return const CreateProfilePage();
          } else {
            return Scaffold(
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      duration: const Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.cyan,
                      tabs: const [
                        GButton(
                          icon: FontAwesomeIcons.house,
                          text: 'Home',
                        ),
                        GButton(
                          icon: FontAwesomeIcons.circlePlus,
                          text: 'Goal',
                        ),
                        GButton(
                          icon: FontAwesomeIcons.user,
                          text: 'Profile',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
