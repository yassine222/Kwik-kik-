import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color cyan = Colors.cyan;

class TimerFrame extends StatefulWidget {
  final String description;
  final Widget timer;
  final bool inverted;

  const TimerFrame({
    required this.description,
    required this.timer,
    this.inverted = false,
    Key? key,
  }) : super(key: key);

  @override
  State<TimerFrame> createState() => _TimerFrameState();
}

String initialVal = "Quit Smoking";
final List<String> quitOptions = [
  'Quit Smoking',
  'Quit Gambling',
  'Quit Drinking',
];

class _TimerFrameState extends State<TimerFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: widget.inverted ? 30 : 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.inverted ? CupertinoColors.white : cyan,
        border: Border.all(
          width: 2,
          color: widget.inverted ? cyan : Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: DropdownButton<String>(
                iconEnabledColor: Colors.cyan,
                value: initialVal,
                items: quitOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle the selection of a new option here
                  print('Selected option: $newValue');
                  setState(() {
                    initialVal = newValue!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            initialVal + " Countdown",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0,
              color: widget.inverted ? cyan : CupertinoColors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          widget.timer,
        ],
      ),
    );
  }
}
