import 'package:flutter/material.dart';
import 'package:kwik_kik/widget/allert_dialoge.dart';
import 'package:lottie/lottie.dart';

class EndOfChalengeCelebration extends StatefulWidget {
  const EndOfChalengeCelebration({super.key});

  @override
  State<EndOfChalengeCelebration> createState() =>
      _EndOfChalengeCelebrationState();
}

class _EndOfChalengeCelebrationState extends State<EndOfChalengeCelebration> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: LottieBuilder.network(
                "https://lottie.host/edb98fd7-b2d7-4271-9994-183824192232/4ImQNRUfQB.json"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ChallengeCompleteDialog();
                  },
                );
              },
              child: Text('Show Challenge Complete Dialog'),
            ),
          ),
        ],
      ),
    );
  }
}
