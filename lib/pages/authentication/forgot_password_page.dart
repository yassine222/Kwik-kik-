import 'package:flutter/material.dart';
import 'package:kwik_kik/widget/buttons/my_text_button.dart';
import 'package:kwik_kik/widget/buttons/small_text_button.dart';
import 'package:kwik_kik/widget/fields/my_text_form_field.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../pages.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _forgotPassKey = GlobalKey<FormState>();

  void _onSumbit() {
    _forgotPassKey.currentState!.validate();
  }

  FocusNode focusNode1 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CircleAvatar(
            backgroundColor: kSecondaryColor.withOpacity(0.1),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kSecondaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 3,
                  ),
                  Center(
                    child: Text(
                      "Forgot your password?",
                      style: kTitle2,
                    ),
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  Image.asset(
                    'assets/images/forgot_password.png',
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: _forgotPassKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Enter your registered email to receive password reset instruction",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyTextFormField(
                              hint: 'Email',
                              icon: Icons.email_outlined,
                              fillColor: kScaffoldBackground,
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              focusNode: focusNode1,
                              validator: emailValidator,
                            ),
                            MyTextButton(
                              buttonName: 'Send reset link',
                              onPressed: _onSumbit,
                              bgColor: kPrimaryColor,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Remember password?',
                            style: kBodyText3,
                          ),
                          SmallTextButton(
                            buttonText: 'Login',
                            page: LoginPage(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
