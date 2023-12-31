import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  const ButtonWidget({
    Key? key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      child: Text(
        text!,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
