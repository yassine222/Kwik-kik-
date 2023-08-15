import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:kwik_kik/widget/timer_frame.dart';

class TimerBasic extends StatelessWidget {
  final CountDownTimerFormat format;
  final bool inverted;

  TimerBasic({
    required this.format,
    this.inverted = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      format: format,
      endTime: DateTime.parse("2023-09-01 00:00:00"),
      onEnd: () {
        print("Timer finished");
      },
      timeTextStyle: TextStyle(
        color: (inverted) ? cyan : CupertinoColors.white,
        fontWeight: FontWeight.w300,
        fontSize: 40,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      colonsTextStyle: TextStyle(
        color: (inverted) ? cyan : CupertinoColors.white,
        fontWeight: FontWeight.w300,
        fontSize: 40,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      descriptionTextStyle: TextStyle(
        color: (inverted) ? cyan : CupertinoColors.white,
        fontSize: 10,
        fontFeatures: <FontFeature>[
          FontFeature.tabularFigures(),
        ],
      ),
      spacerWidth: 0,
      daysDescription: "days",
      hoursDescription: "hours",
      minutesDescription: "minutes",
      secondsDescription: "seconds",
    );
  }
}
