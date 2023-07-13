import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../classes/language_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  String countryCode = "";
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Set Profile"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      foregroundImage: NetworkImage(
                                              "https://cdn4.iconfinder.com/data/icons/evil-icons-user-interface/64/avatar-512.png")
                                          as ImageProvider,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(90, 90, 0, 0),
                                    child: const Icon(
                                      Icons.add_circle,
                                      size: 25.0,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: translation(context).name,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your user name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Text"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your mobile number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          IntlPhoneField(
                            pickerDialogStyle: PickerDialogStyle(
                                countryNameStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                countryCodeStyle: const TextStyle(
                                  color: Colors.black,
                                )),
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            initialCountryCode: 'US',
                            onChanged: (PhoneNumber number) {
                              print(number.completeNumber);
                            },
                          ),
                          const SizedBox(height: 15.0),
                          const SizedBox(height: 20.0),
                          Container(
                            child: ElevatedButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Save".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
