import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwik_kik/router/route_constants.dart';
import 'package:kwik_kik/widget/buttons/large_icon_button.dart';
import 'package:kwik_kik/widget/buttons/my_text_button.dart';
import 'package:kwik_kik/widget/buttons/small_text_button.dart';
import 'package:kwik_kik/widget/fields/my_password_field.dart';
import 'package:kwik_kik/widget/fields/my_text_form_field.dart';
import '../../app_styles.dart';
import '../../controller/auth_controller.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../pages.dart';

// its best practice to do relative imports

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();

  void onSubmit() {
    _loginKey.currentState!.validate();
  }

  final List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _loginFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                Text(
                  'Welcome to\nKwik Kik',
                  style: kTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    LargeIconButton(
                      onpressed: () {
                        AuthController.instance.signInWithGoogle(context);
                      },
                      buttonName: 'Continue with Google',
                      iconImage: 'assets/images/auth/google_icon.png',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LargeIconButton(
                      onpressed: () {
                        AuthController.instance.signInWithFacebook(context);
                      },
                      buttonName: 'Continue with Facebook',
                      iconImage: 'assets/images/auth/facebook_icon.png',
                    )
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Login with email',
                        style: kBodyText3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _loginKey,
                          child: Column(
                            children: [
                              MyTextFormField(
                                controller: emailController,
                                hint: 'Email',
                                icon: Icons.email_outlined,
                                fillColor: kScaffoldBackground,
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                focusNode: _loginFocusNodes[0],
                                validator: emailValidator,
                              ),
                              MyPasswordField(
                                hint: "Password",
                                controller: passwordController,
                                fillColor: kScaffoldBackground,
                                focusNode: _loginFocusNodes[1],
                                validator: passwordValidator,
                              ),
                              MyTextButton(
                                buttonName: 'Login',
                                onPressed: () {
                                  onSubmit();
                                  AuthController.instance.login(
                                      context,
                                      emailController.text.trim(),
                                      passwordController.text.trim());
                                },
                                bgColor: kPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const ForgotPasswordPage());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: kBodyText3.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // Text("Don't have an account? "),
                          SmallTextButton(
                            buttonText: 'Sign up',
                            page: SignUpPage(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
