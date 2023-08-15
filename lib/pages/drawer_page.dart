import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kwik_kik/controller/auth_controller.dart';
import 'package:kwik_kik/pages/profile_page.dart';
import 'package:kwik_kik/pages/settings_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.cyan[300]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        Get.to(() => const ProfilePage());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AuthController.instance.auth.currentUser!.displayName ??
                      "User Name".toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  AuthController.instance.auth.currentUser!.email.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: _drawerIconSize,
            ),
            title: Text(
              'Home Page',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              navigator?.pop(context);
            },
          ),
          const Divider(
            color: Colors.white,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              size: _drawerIconSize,
            ),
            title: Text(
              'Add Challenge',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.white,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: _drawerIconSize,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              Get.to(() => const SettingsPage());
            },
          ),
          const Divider(
            color: Colors.white,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              AuthController.instance.logOut();
            },
          ),
        ],
      ),
    );
  }
}
