import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwik_kik/controller/goal_controller.dart';
import 'package:kwik_kik/pages/challenge_list_page.dart';

import '../widget/challenge_type_widget.dart';

class AddGoalPage extends StatefulWidget {
  const AddGoalPage({super.key});

  @override
  State<AddGoalPage> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends State<AddGoalPage> {
  final bool hasChallenge = false;

  @override
  final DocumentIdController _documentIdController =
      Get.put(DocumentIdController(
    'challengeType',
  )); // Replace with your collection path
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goal"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: hasChallenge
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text("No chalenge yet")],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/nodata.png'),
                      Text('You dont have any challenge yet'),
                      ElevatedButton(
                          onPressed: () {
                            showBottomSheet();
                          },
                          child: Text('Set a Goal'))
                    ],
                  )),
      ),
    );
  }

  Future<dynamic> showBottomSheet() {
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'What Type of Goal You like set ?',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: Obx(() {
                      if (_documentIdController.documentIds.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.count(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 20, // Spacing between columns
                          mainAxisSpacing: 20, // Spacing between rows
                          padding: EdgeInsets.all(16),
                          children: _documentIdController.documentIds
                              .map((documentId) {
                            return CustomClickableContainer(
                              text: documentId,
                              onTap: () {
                                Get.to(() =>
                                    ChallengeList(challengeTypeId: documentId));
                              },
                            );
                          }).toList(),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
