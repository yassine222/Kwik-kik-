import 'package:flutter/material.dart';
import 'package:kwik_kik/classes/language.dart';
import 'package:kwik_kik/classes/language_constants.dart';
import 'package:kwik_kik/main.dart';
import 'package:kwik_kik/theme/theme1.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _toggleTheme() {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: Column(children: [
        DropdownButton<Language>(
          iconSize: 30,
          hint: Text('changeLanguage'),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        Center(
          child: Row(
            children: [
              Icon(Icons.nightlight_round,
                  color: isDark ? Colors.black : Colors.cyan),
              SizedBox(width: 8.0),
              Text(
                isDark ? 'Dark Mode' : "Light Mode",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8.0),
              Switch(
                activeColor: isDark ? Colors.black : Colors.cyan,
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    _toggleTheme();
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
