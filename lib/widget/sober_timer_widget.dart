import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SoberTimer extends StatefulWidget {
  @override
  _SoberTimerState createState() => _SoberTimerState();
}

class _SoberTimerState extends State<SoberTimer>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _days = 5;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    startTimer();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    DateTime startTime = DateTime.now(); // Replace with your start time

    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        Duration difference = DateTime.now().difference(startTime);
        _days = difference.inDays;
        _hours = difference.inHours % 24;
        _minutes = difference.inMinutes % 60;
        _seconds = difference.inSeconds % 60;
      });
    });
  }

  final CountDownController _countController = CountDownController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularCountDownTimer(
              duration: 60,
              initialDuration: 5,
              controller: _countController,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.purpleAccent[100]!,
              fillGradient: null,
              backgroundColor: Colors.purple[500],
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {},
              onComplete: () {
                _countController.restart(duration: 60);
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Start";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: _days / 365,
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Transform.scale(
                      scale: _animation.value,
                      child: Text(
                        '$_days days',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: _minutes / 60,
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Transform.scale(
                      scale: _animation.value,
                      child: Text(
                        '$_minutes minutes',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 8),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: _seconds / 60,
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Transform.scale(
                      scale: _animation.value,
                      child: Text(
                        '$_seconds seconds',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
