import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kwik_kik/pages/drawer_page.dart';
import 'package:kwik_kik/pages/home_page2.dart';
import 'package:kwik_kik/widget/drawer_widget.dart';
import 'package:kwik_kik/widget/end_of_chalenge_celebration.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const EndOfChalengeCelebration(),
    Scaffold(
      appBar: AppBar(
        title: const Text("Add a Goal"),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.cyan,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
}
