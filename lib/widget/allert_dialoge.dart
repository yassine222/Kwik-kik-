import 'package:flutter/material.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:lottie/lottie.dart';

class ChallengeCompleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AlertDialog(
        title: Text('Challenge Completed!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                'assets/images/celebration.png'), // Replace with your image asset path
            SizedBox(height: 16),
            Text(
                'Congratulations! You have successfully completed the challenge.'),
          ],
        ),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    // Handle refund action
                    Navigator.of(context).pop();
                    // Add your refund logic here
                  },
                  child: Text(
                    'Refund',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle later action
                    Navigator.of(context).pop();
                    // Add your "Later" logic here
                  },
                  child: Text(
                    'Later',
                    style: TextStyle(color: Colors.cyan),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      LottieBuilder.network(
          "https://lottie.host/edb98fd7-b2d7-4271-9994-183824192232/4ImQNRUfQB.json"),
    ]);
  }
}
