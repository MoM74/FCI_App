import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../components/rounded_button.dart';
import '../../../../../layout/fci_app/fci_layout.dart';
import '../../../../../shared/components/components.dart';
import '../../../profile/profile_screenn.dart';
import '../../constants.dart';
import '../../controllers/question_controller.dart';
import 'grade.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns }/${_qnController.questions.length }",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
              RoundedButton(
                text: "Finsh quiz",
                press: () {
                  navigateAndFinish(
                    context,
                      MyGrade()
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
