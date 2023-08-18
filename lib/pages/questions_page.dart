import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:input_quantity/input_quantity.dart';

import '../theme/theme1.dart';

class QuestionPage extends StatefulWidget {
  final String challengeType;
  const QuestionPage({super.key, required this.challengeType});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentStep = 0;

  double _currenValue = 30.0;
  int _selectedValue = 30;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.challengeType),
      ),
      body: SafeArea(
        child: Stepper(
          elevation: 34,
          controlsBuilder: (context, details) {
            return Row(
              children: <Widget>[
                _currentStep != 3
                    ? TextButton(
                        style: ButtonStyle(),
                        onPressed: details.onStepContinue,
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      )
                    : SizedBox(),
                TextButton(
                  onPressed: details.onStepCancel,
                  child:
                      const Text('Back', style: TextStyle(color: Colors.cyan)),
                ),
              ],
            );
          },
          steps: [
            Step(
                isActive: _currentStep == 0,
                title: Text(
                  'How much time do you want to achieve your goal in ?',
                  style: TextStyle(color: Colors.grey),
                ),
                content: Row(
                  children: [
                    Slider(
                      max: 180.0,
                      min: 30.0,
                      value: _currenValue,
                      onChanged: (value) {
                        setState(() {
                          _currenValue = value;
                          _selectedValue = value.toInt();
                        });
                      },
                    ),
                    Text('$_selectedValue days')
                  ],
                )),
            Step(
              isActive: _currentStep == 1,
              title: Text(
                'How many cigarettes do you smoke per day ?',
                style: TextStyle(color: Colors.grey),
              ),
              content: TextField(
                keyboardType: TextInputType.number,
              ),
            ),
            Step(
              isActive: _currentStep == 2,
              title: Text(
                'Why Im doing this ?',
                style: TextStyle(color: Colors.grey),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Invest in your well-being and reap the rewards! Get 90% of your money back by reclaiming a life without this bad habit.'),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter your amount (min 10€)',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputQty(
                      btnColor1: Colors.cyan,
                      maxVal: 500,
                      initVal: 10,
                      showMessageLimit: false,
                      minVal: 10,
                      isIntrinsicWidth: false,
                      borderShape: BorderShapeBtn.circle,
                      boxDecoration: const BoxDecoration(),
                      textFieldDecoration: const InputDecoration(
                          isDense: false,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                      steps: 10,
                      onQtyChanged: (val) {
                        print(val);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Step(
              isActive: _currentStep == 3,
              title: Text(
                'Make payment',
                style: TextStyle(color: Colors.grey),
              ),
              content: Column(
                children: [
                  CardFormField(
                    style: CardFormStyle(cursorColor: Colors.cyan),
                    controller: CardFormEditController(),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text(
                          'Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          onStepTapped: (int index) {
            setState(() {
              _currentStep = index;
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 3) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
