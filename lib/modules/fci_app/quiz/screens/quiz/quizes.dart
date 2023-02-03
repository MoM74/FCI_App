import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/modules/fci_app/lecture_temp.dart';
import 'package:fci_project/modules/fci_app/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../layout/fci_app/cubit/cubit.dart';
import '../../../../../layout/fci_app/cubit/states.dart';
import '../../../../../models/fci_app/lectures_model.dart';
import '../../../../../models/fci_app/quiz_model.dart';
import '../../../../../shared/components/components.dart';
import '../welcome/welcome_screen.dart';
import 'my_quiz.dart';

class QuizesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Quizes',
            ),
          ),
          body: ConditionalBuilder(
            condition: FciCubit.get(context).quizModel != null,
            builder: (context) => builderQuizWidget(FciCubit.get(context).quizModel!,context),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
Widget builderQuizWidget(QuizModel model, context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1 / 1.1,
          children: List.generate(
            model.data.subjectQuiz.length,
                (index) => buildGridQuizes(model.data.subjectQuiz[index], context),
          ),
        ),
      ],
    ),
  );


Widget buildGridQuizes(SubjectQuiz subjectQuiz, context) => GestureDetector(
    child: MyQuiz(
      quizname: subjectQuiz.title,
    ),
    onTap: () {
      navigateTo(context, WelcomeQuizScreen());
    }
);
