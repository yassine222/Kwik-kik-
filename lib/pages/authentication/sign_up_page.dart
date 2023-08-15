import 'package:flutter/material.dart';
import 'package:kwik_kik/widget/buttons/large_icon_button.dart';
import 'package:kwik_kik/widget/buttons/my_text_button.dart';
import 'package:kwik_kik/widget/buttons/small_text_button.dart';
import 'package:kwik_kik/widget/fields/my_check_box.dart';
import 'package:kwik_kik/widget/fields/my_password_field.dart';
import 'package:kwik_kik/widget/fields/my_text_form_field.dart';
import '../../app_styles.dart';
import '../../controller/auth_controller.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();

  void onSubmit() {
    _signUpKey.currentState!.validate();
  }

  final List<FocusNode> _signUpFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    for (var element in _signUpFocusNodes) {
      element.addListener(() {
        setState(() {});
      });
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/login.png'),
                ),
                SizedBox(
                  height: height * 2,
                ),
                Text(
                  'Create Your Account',
                  style: kTitle2,
                ),
                SizedBox(
                  height: height * 2,
                ),
                Form(
                  key: _signUpKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                          controller: emailController,
                          hint: 'Email',
                          icon: Icons.email_outlined,
                          fillColor: Colors.white,
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          focusNode: _signUpFocusNodes[0],
                          validator: emailValidator),
                      MyPasswordField(
                        hint: "Password",
                        controller: passwordController,
                        fillColor: Colors.white,
                        focusNode: _signUpFocusNodes[1],
                        validator: passwordValidator,
                      ),
                      MyPasswordField(
                          hint: "Confirm Password",
                          controller: confirmPasswordController,
                          fillColor: Colors.white,
                          focusNode: _signUpFocusNodes[2],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Password not Match';
                            }

                            return null;
                          }),
                      MyTextButton(
                        buttonName: 'Create Account',
                        onPressed: () {
                          if (_signUpKey.currentState!.validate()) {
                            AuthController.instance.register(
                                context,
                                emailController.text.trim(),
                                passwordController.text.trim());
                          }
                        },
                        bgColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 3,
                          color: kSecondaryColor.withOpacity(0.4),
                        ),
                      ),
                      Text(
                        'Or sign in with',
                        style: kBodyText3,
                      ),
                      Expanded(
                        child: Divider(
                          height: 3,
                          color: kSecondaryColor.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: LargeIconButton(
                        buttonName: 'Google',
                        iconImage: 'assets/images/auth/google_icon.png',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: LargeIconButton(
                      buttonName: 'Facebook',
                      iconImage: 'assets/images/auth/facebook_icon.png',
                    )),
                  ],
                ),
                SizedBox(
                  height: height * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: kBodyText3,
                    ),
                    const SmallTextButton(
                      buttonText: 'Sign in',
                      page: LoginPage(),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
