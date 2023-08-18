import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kwik_kik/controller/challenge_list_controller.dart';
import 'package:kwik_kik/pages/questions_page.dart';

import '../controller/goal_controller.dart';
import '../widget/challengeMenu.dart';

class ChallengeList extends StatefulWidget {
  final String challengeTypeId;
  const ChallengeList({super.key, required this.challengeTypeId});

  @override
  State<ChallengeList> createState() => _ChallengeListState();
}

class _ChallengeListState extends State<ChallengeList> {
  @override
  Widget build(BuildContext context) {
    final ChallengeListController _documentIdController = Get.put(
        ChallengeListController('challengeType', widget.challengeTypeId));
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (_documentIdController.documentIds.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _documentIdController.documentIds.length,
            itemBuilder: (context, index) {
              final documentId = _documentIdController.documentIds[index];
              return ChallengeListile(documentId: documentId);
            },
          );
        }
      }),
    );
  }
}

class ChallengeListile extends StatelessWidget {
  const ChallengeListile({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  Widget build(BuildContext context) {
    return ProfileMenu(
        press: () {
          Get.to(QuestionPage(challengeType: documentId));
        },
        text: documentId,
        icon: documentId == 'Alcohol'
            ? FontAwesomeIcons.beerMugEmpty
            : documentId == 'Gambling'
                ? FontAwesomeIcons.dice
                : documentId == 'Smoking'
                    ? FontAwesomeIcons.smoking
                    : documentId == 'Video Games'
                        ? FontAwesomeIcons.playstation
                        : documentId == 'Meditation'
                            ? FontAwesomeIcons.spa
                            : documentId == 'Socializing'
                                ? FontAwesomeIcons.users
                                : documentId == 'Volunteering'
                                    ? FontAwesomeIcons.handsHelping
                                    : documentId == 'Yoga'
                                        ? FontAwesomeIcons.sprout
                                        : documentId == 'Gain Weight'
                                            ? FontAwesomeIcons.weight
                                            : documentId == 'Lose Weight'
                                                ? FontAwesomeIcons.dumbbell
                                                : FontAwesomeIcons.bottleWater);
  }
}
