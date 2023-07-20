import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kwik_kik/widget/sober_timer_widget.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Container(
          color: Colors.cyan,
          child: ContainedTabBarView(
            tabBarProperties:
                const TabBarProperties(indicatorColor: Colors.white),
            tabs: const [Text('Summary'), Text('Savings'), Text("Ranking")],
            views: [
              Scaffold(
                body: SoberTimer(),
              ),
              Container(color: Colors.white),
              Container(color: Colors.white),
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }
}
