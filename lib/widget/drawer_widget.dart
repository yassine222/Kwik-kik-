import 'package:flutter/material.dart';

import '../classes/language_constants.dart';
import '../router/route_constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              onDetailsPressed: () =>
                  Navigator.pushNamed(context, profilePageRoute),
              decoration:
                  BoxDecoration(color: isDark ? Colors.black : Colors.cyan),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              ),
              accountName: const Text("accountName"),
              accountEmail: const Text("accountEmail")),
          ListTile(
            leading: const Icon(
              Icons.info,
            ),
            title: Text(
              translation(context).aboutUs,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text(
              translation(context).settings,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: Text(
              translation(context).reminder,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, reminderPageRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: Text(
              translation(context).logout,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
