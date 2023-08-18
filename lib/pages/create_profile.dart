import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kwik_kik/controller/auth_controller.dart';
import 'package:kwik_kik/model/profile.dart';

import '../controller/profile_controller.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  TextEditingController birthDateController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? imageUrl;

  File? image;

  Timestamp? birthdatePicked;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    birthDateController.dispose();
    userNameController.dispose();
    sexController.dispose();
    addressController.dispose();
    super.dispose();
  }

  final List<String> genderItems = [
    'Rather dont say',
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  final UserProfileController _userProfileController =
      Get.put(UserProfileController());

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
          title: const Text("Profile"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl ??
                                "https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg"),
                          ),
                          Positioned(
                            right: -16,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.white),
                                  ),
                                  backgroundColor: Color(0xFFF5F6F9),
                                ),
                                onPressed: () {
                                  pickImage();
                                },
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.cyan,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      prefixIconColor: Colors.cyan,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Your User Name.',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.venusMars),
                      prefixIconColor: Colors.cyan,
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // Add more decoration..
                    ),
                    hint: const Text(
                      'Select Your Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      sexController.text = value!;
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: birthDateController,
                    onTap: () async {
                      DateTime? pickedDate = await pickBirthDate(context);

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          birthdatePicked = Timestamp.fromDate(pickedDate);
                          birthDateController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      prefixIconColor: Colors.cyan,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Your Birth Date',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      prefixIconColor: Colors.cyan,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Your Adress.',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _userProfileController.createProfile(UserProfile(
                          id: AuthController.instance.auth.currentUser!.uid,
                          userName: userNameController.text,
                          email: AuthController.instance.auth.currentUser!.email
                              .toString(),
                          imageUrl: imageUrl,
                          sexe: sexController.text,
                          birtthDate: birthdatePicked,
                          address: addressController.text,
                          createdAt: Timestamp.now()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, // Set the background color to cyan
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set the border radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickBirthDate(BuildContext context) {
    return showDatePicker(
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
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 1);

      if (image == null) return;
      final imageTemp = File(image.path);
      Reference ref = FirebaseStorage.instance
          .ref('profileImages')
          .child(AuthController().auth.currentUser!.uid);
      await ref.putFile(imageTemp);
      ref.getDownloadURL().then((value) {
        setState(() {
          imageUrl = value;
        });
        print(value);
      });

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
