import 'package:flutter/material.dart';
import 'package:kwik_kik/classes/language.dart';
import 'package:kwik_kik/classes/language_constants.dart';
import 'package:kwik_kik/main.dart';
import 'package:kwik_kik/theme/theme1.dart';
import 'package:kwik_kik/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _toggleTheme() {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homePage),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
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
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                translation(context).personalInformation,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).name,
              hintText: translation(context).nameHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).email,
              hintText: translation(context).emailHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: translation(context).dateOfBirth,
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await pickDate(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              if (_key.currentState != null && _key.currentState!.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                translation(context).submitInfo,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 20),
      builder: (context, child) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
        return Theme(
          data: !isDark
              ? Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.cyan, // <-- SEE HERE
                    onPrimary: Colors.white, // <-- SEE HERE
                    onSurface: Colors.cyan, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.cyan, // button text color
                    ),
                  ),
                )
              : Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.white, // <-- SEE HERE
                    onPrimary: Colors.black, // <-- SEE HERE
                    onSurface: Colors.white, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // button text color
                    ),
                  ),
                ),
          child: child!,
        );
      },
    );
  }
}
